<?php

namespace AppBundle\Command;

use AppBundle\Entity\Loyalty;
use AppBundle\Entity\Repository\LoyaltyRepository;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputDefinition;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Regex;
use Symfony\Component\Validator\Constraints\Url;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Component\Yaml\Exception\ParseException;
use Symfony\Component\Yaml\Yaml;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class CreateLoyaltyConnectionCommand extends ContainerAwareCommand
{
    /** @var  LoyaltyRepository */
    private $loyaltyRepository;
    /** @var  ValidatorInterface */
    private $validator;

    /**
     * {@inheritdoc}
     */
    protected function configure()
    {
        $this->setName('loyalty:create')
            ->setDescription('Crea una nueva conexion con un loyalty')
            ->setDefinition(new InputDefinition([
                new InputArgument('code', InputArgument::REQUIRED),
                new InputArgument('name', InputArgument::REQUIRED),
                new InputArgument('wsdl', InputArgument::REQUIRED),
                new InputArgument('namespace', InputArgument::REQUIRED),
                new InputArgument('api_key', InputArgument::REQUIRED),
                new InputArgument('encrypter_key', InputArgument::REQUIRED),
                new InputArgument('sso_username', InputArgument::REQUIRED),
                new InputArgument('sso_private_key', InputArgument::REQUIRED),
                new InputArgument('sso_base_url', InputArgument::REQUIRED),
                new InputArgument('configuration', InputArgument::OPTIONAL),
            ]));
    }

    protected function initialize(InputInterface $input, OutputInterface $output)
    {
        $this->loyaltyRepository = $this->getContainer()->get('app.repository.loyalty');
        $this->validator = $this->getContainer()->get('validator');
        // Para mostrar los errores de validacion en ingles (sin acentos)
        $this->getContainer()->get('translator')->setLocale('en');
    }


    /**
     * {@inheritdoc}
     */
    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $io = new SymfonyStyle($input, $output);

        $io->section('A continuacion los datos que seran almacenados en la base de datos:');

        $name = $input->getArgument('name');
        $code = $input->getArgument('code');
        $wsdl = $input->getArgument('wsdl');
        $namespace = $input->getArgument('namespace');
        $apiKey = $input->getArgument('api_key');
        $encrypterKey = $input->getArgument('encrypter_key');
        $ssoBaseUrl = $input->getArgument('sso_base_url');
        $ssoUsername = $input->getArgument('sso_username');
        $ssoPrivateKey = $input->getArgument('sso_private_key');
        $configuration = $input->getArgument('configuration');

        $io->table(['Opcion', 'Valor'], [
            ['Nombre', $name],
            ['Codigo', $code],
            ['Url del WSDL', $wsdl],
            ['Namespace de API', $namespace],
            ['Api Key', $apiKey],
            ['Clave de encriptado', $encrypterKey],
            ['SSO Base url', $ssoBaseUrl],
            ['SSO nombre de usuario', $ssoUsername],
            ['SSO clave privada', $ssoPrivateKey],
            ['Configuracion Adicional', Yaml::dump($configuration)],
        ]);

        $res = $io->confirm('Realmente quiere crear una conexion al loyalty con estos datos?');

        if (!$res) {
            $io->caution('No se ha creado la configuracion para el loyalty');
        }

        $loyalty = new Loyalty();
        $loyalty->setCode($code);
        $loyalty->setName($name);
        $loyalty->setWsdl($wsdl);
        $loyalty->setNamespace($namespace);
        $loyalty->setApiKey($apiKey);
        $loyalty->setEncrypterKey($encrypterKey);
        $loyalty->setSsoBaseUrl($ssoBaseUrl);
        $loyalty->setSsoUsername($ssoUsername);
        $loyalty->setSsoPrivateKey($ssoPrivateKey);
        $loyalty->setConfiguration($configuration);
        $loyalty->setIsActive(true);

        $this->loyaltyRepository->save($loyalty);

        $io->success('Los datos han sido almacenados exitosamente!');
    }

    protected function interact(InputInterface $input, OutputInterface $output)
    {
        $io = new SymfonyStyle($input, $output);
        $io->section('Bienvenido al Loyalty Generador');

        $this->getBasicLoyaltyValues($input, $io);
        $this->getApiLoyaltyValues($input, $io);
        $this->getSsoLoyaltyValues($input, $io);
        $this->getExtraLoyaltyValues($input, $io);
    }

    /**
     * @param InputInterface $input
     * @param $io
     */
    protected function getBasicLoyaltyValues(InputInterface $input, $io)
    {
        $io->comment('Informacion del Loyalty');

        if (!$input->getArgument('code')) {
            $input->setArgument('code', $io->ask('Por favor ingrese un Codigo', null, function ($value) {

                $this->validate($value, [
                    new NotBlank(),
                    new Regex([
                        'pattern' => '/^[a-zA-Z0-9\_\-\+]+$/',
                        'message' => 'The code could not contains spaces or special characters',
                    ]),
                ]);

                if ($this->loyaltyRepository->findOneByCode($value)) {
                    throw new \InvalidArgumentException('Ya existe un loyalty con este codigo');
                }

                return $value;
            }));
        }

        if (!$input->getArgument('name')) {
            $input->setArgument('name', $io->ask('Por favor ingrese un Nombre', null, function ($value) {
                $this->validate($value, new NotBlank());

                return $value;
            }));
        }

        $io->newLine();
    }

    /**
     * @param InputInterface $input
     * @param $io
     */
    protected function getApiLoyaltyValues(InputInterface $input, $io)
    {
        $io->comment('Informacion del Api para la comuniacion con el Loyalty');

        if (!$input->getArgument('wsdl')) {
            $input->setArgument('wsdl', $io->ask('Por favor ingrese la url al WSDL', null, function ($value) {
                $this->validate($value, [new NotBlank(), new Url()]);

                return $value;
            }));
        }

        $namespace = Request::create($input->getArgument('wsdl'))->getSchemeAndHttpHost();

        if (!$input->getArgument('namespace')) {
            $input->setArgument('namespace',
                $io->ask('Por favor ingrese el namespace del api', $namespace, function ($value) {
                    $this->validate($value, [new NotBlank(), new Url()]);

                    return $value;
                }));
        }

        if (!$input->getArgument('api_key')) {
            $input->setArgument('api_key',
                $io->ask('Por favor ingrese el apiKey del api', null, function ($value) {
                    $this->validate($value, new NotBlank());

                    return $value;
                }));
        }

        if (!$input->getArgument('encrypter_key')) {
            $input->setArgument('encrypter_key',
                $io->ask('Por favor ingrese la clave de encryptado del api', null, function ($value) {
                    $this->validate($value, new NotBlank());

                    return $value;
                }));
        }

        $io->newLine();
    }

    /**
     * @param InputInterface $input
     * @param $io
     */
    protected function getSsoLoyaltyValues(InputInterface $input, $io)
    {
        $io->comment('Configuracion del Login [Single Sign On]');

        if (!$input->getArgument('sso_base_url')) {
            $input->setArgument('sso_base_url',
                $io->ask('Por favor ingrese la url base para el SSO', null, function ($value) {
                    $this->validate($value, [new NotBlank(), new Url()]);

                    return $value;
                }));
        }

        if (!$input->getArgument('sso_username')) {
            $input->setArgument('sso_username',
                $io->ask('Por favor ingrese el username para el SSO', null, function ($value) {
                    $this->validate($value, new NotBlank());

                    return $value;
                }));
        }

        if (!$input->getArgument('sso_private_key')) {
            $input->setArgument('sso_private_key',
                $io->ask('Por favor ingrese la clave privada para el SSO', null, function ($value) {
                    $this->validate($value, new NotBlank());

                    return $value;
                }));
        }

        $io->newLine();
    }

    /**
     * @param InputInterface $input
     * @param $io
     */
    protected function getExtraLoyaltyValues(InputInterface $input, $io)
    {
        $io->comment('Configuracion Adicional');

        if (!$input->getArgument('configuration')) {
            $input->setArgument('configuration',
                $io->ask(
                    'Por favor ingrese la configuracion adicional para el loyalty (en YAML)',
                    null,
                    function ($value) {
                        if (empty($value)) {
                            return [];
                        }

                        try {
                            $value = Yaml::parse($value, true);
                        } catch (ParseException $e) {
                            throw new \InvalidArgumentException($e->getMessage());
                        }

                        if (!is_array($value)) {
                            throw new \InvalidArgumentException('La configuracion solo puede ser un valor null o un arreglo');
                        }

                        return $value;
                    }));
        }
    }

    private function validate($value, $constraints)
    {
        if (count($errors = $this->validator->validate($value, $constraints))) {
            throw new \InvalidArgumentException($errors[0]->getMessage());
        }
    }
}
