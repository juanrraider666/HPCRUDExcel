<?php
/**
 * 05/09/14
 */
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Finder\Finder;
use Symfony\Component\HttpFoundation\Request;

/**
 * @autor Manuel Aguirre <programador.manuel@gmail.com>
 */

require __DIR__ . '/../vendor/autoload.php';

$request = Request::createFromGlobals();

$loadDirs = function () {
    return Finder::create()
        ->in(__DIR__ . '/../app/cache')
        ->depth(0)
        ->directories();
};

$dirs = $loadDirs();

if ($request->isMethod('POST')) {
    $filesystem = new Filesystem();
    $filesystem->remove($request->get('dirs'));
    echo "Files Removed!!!!";

    $dirs = $loadDirs();
}

?>
<form method="post" action="<?= $request->getRequestUri() ?>">
    <select name="dirs[]" multiple="multiple">
        <?php foreach ($dirs as $index => $dir): ?>
            <option value="<?= $index ?>"><?= $dir->getFilename() ?></option>
        <?php endforeach; ?>
    </select>
    <input type="submit">
</form>

