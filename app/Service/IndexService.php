<?php
declare(strict_types=1);

namespace App\Service;

use App\Exception\BusinessException;
use Hyperf\Contract\TranslatorInterface;
use Hyperf\Utils\ApplicationContext;

class IndexService
{
    public function info(int $id)
    {
        if ($id <= 0) {
//            $translator = ApplicationContext::getContainer()->get(TranslatorInterface::class);
//            $translator->setLocale('ja');
            throw new BusinessException(trans('params.id_invalid'), 500);
        }
        return ['info' => 'data info'];
    }
}