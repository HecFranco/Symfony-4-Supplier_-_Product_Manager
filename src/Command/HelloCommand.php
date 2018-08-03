<?php

namespace App\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Question\Question;

use App\Services\Greeting;

class HelloCommand extends Command
{
    /**
     * @var Greeting
     */
    private $greeting;

    public function __construct(Greeting $greeting)
    {
        $this->greeting = $greeting;

        parent::__construct();
    }

    protected function configure()
    {
        $this->setName('app:say-hello')
            ->setDescription('Says hello to the user')
            ->addArgument('name', InputArgument::REQUIRED)
            ->addArgument('db', InputArgument::OPTIONAL);
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $name = $input->getArgument('name');

        // Get the question helper
        $helper = $this->getHelper('question');
        // Create a question instance
        $question = new Question("What's the database name?", 'defualt');
        // This would return user input
        $result = $helper->ask($input, $output, $question);

        $output->writeln([
            'Hello from the app',
            '==================',
            "Answer is $result"
        ]);
        $output->writeln($this->greeting->greet($name));
    }
}