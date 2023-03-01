<?php

declare(strict_types=1);
/**
 * This file is part of Hyperf.
 *
 * @link     https://www.hyperf.io
 * @document https://hyperf.wiki
 * @contact  group@hyperf.io
 * @license  https://github.com/hyperf/hyperf/blob/master/LICENSE
 */
namespace App\Controller;

use App\Service\IndexService;
use App\Service\Instance\JwtInstance;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\AutoController;
use Hyperf\Utils\Coroutine;
use Hyperf\Context\Context;
use Hyperf\DbConnection\Db;

#[AutoController]
class IndexController extends AbstractController
{
    public function info()
    {
        $result = Db::select('SELECT * FROM email_code;');
        return $result;
    }
}
