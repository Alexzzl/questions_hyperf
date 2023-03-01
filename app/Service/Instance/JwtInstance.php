<?php
declare(strict_types=1);
namespace App\Service\Instance;
use Hyperf\Utils\Traits\StaticInstance;

class JwtInstance
{
    use StaticInstance;

    public $id;

    public $user;

    public function encode($user)
    {
        $this->id = $user['id'];
        $this->user = $user;
    }
}