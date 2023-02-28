<?php
declare(strict_types=1);

namespace App\Service;

use App\Constants\ErrorCode;
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
//            throw new BusinessException(trans('params.id_invalid'), 500);
            throw new BusinessException(ErrorCode::getMessage(ErrorCode::PARAMS_ID_INVALID));
        }
        return ['info' => 'data info'];
    }
}