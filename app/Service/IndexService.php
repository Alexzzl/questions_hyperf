<?php
declare(strict_types=1);

namespace App\Service;

use App\Exception\BusinessException;

class IndexService
{
    public function info(int $id)
    {
        if ($id <= 0) {
            throw new BusinessException("id无效", 500);
        }
        return ['info' => 'data info'];
    }
}