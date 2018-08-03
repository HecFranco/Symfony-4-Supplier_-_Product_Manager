<?php
/**
 * Created by PhpStorm.
 * User: usuario
 * Date: 24/07/2018
 * Time: 21:05
 */

namespace App\Command;

use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class DeployCommand extends ContainerAwareCommand
{


    public function __construct( )
    {
        parent::__construct();
    }

    protected function configure()
    {
        $this
            ->setName('app:deploy')
            ->setDescription('Creates folders and config file if not exist.')
            ->setHelp('This command allows you to configure composer...');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $output->writeln([
            'Check if config file exists.',
        ]);
        $directory = './config/jwt';
        $filename_public_pem = $directory.'/public.pem';
        $filename_private_pem = $directory.'/private.pem';
        if ( !file_exists($filename_public_pem) || !file_exists($filename_private_pem) ) {
            $key = getenv('JWT_PASSPHRASE');
            $output->writeln([
                'File not exists.',
                'Creating...',
            ]);
            mkdir('config/jwt', 0777, true);
            $output->writeln([
                'Folder no exists.',
                'Creating...',
            ]);
            exec('openssl genrsa -passout pass:'.$key.' -out config/jwt/private.pem -aes256 4096');
            exec('openssl rsa -pubout -in config/jwt/private.pem  -passin pass:'.$key.' -out config/jwt/public.pem');
            $output->writeln([
                'Done.'
            ]);
            return;
        }else{
            $output->writeln([
                'File exists.'
            ]);
        }
    }
}