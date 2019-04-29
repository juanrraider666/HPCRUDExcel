<?php

namespace AppBundle\Util;

/**
 * @author Manuel Aguirre <programador.manuel@gmail.com>
 */
class Encrypter
{
    public function encrypt($data, $key, $encodeBase64 = true)
    {
        $encoded = mcrypt_encrypt(
            MCRYPT_RIJNDAEL_256,
            md5($key),
            $data,
            MCRYPT_MODE_CBC,
            md5($key)
        );

        return $encodeBase64 ? base64_encode($encoded) : $encoded;
    }

    public function decrypt($encrypted, $key, $decodeBase64 = true)
    {
        $encrypted = $decodeBase64 ? base64_decode($encrypted) : $encrypted;

        return mcrypt_decrypt(
            MCRYPT_RIJNDAEL_256,
            md5($key),
            $encrypted,
            MCRYPT_MODE_CBC,
            md5($key)
        );
    }
}