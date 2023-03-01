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
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\AutoController;
use Hyperf\Utils\Coroutine;
use Hyperf\Context\Context;

#[AutoController]
class IndexController extends AbstractController
{
    public function index()
    {
        $user = $this->request->input('user', 'Hyperf');
        $method = $this->request->getMethod();

        return [
            'method' => $method,
            'message' => "Hello {$user}.",
        ];
    }

    /**
     * @var IndexService
     */
    #[Inject]
    public $indexService;

    public function info()
    {
        return convert_size(memory_get_usage(true));
//        $id = (int) $this->request->input('id', 0);
//
//        return $this->response->success($this->indexService->info($id));
    }

    public $a;
    public function test()
    {
        $a = $this->request->input('a');
        Context::set('a', $a);
        return [
            'co_is' => Coroutine::inCoroutine(),
            'co_id' => Coroutine::id(),
            'a' => Context::get('a'),
//            'a' => $a,

        ];
    }
}
