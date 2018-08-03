# Symfony-4-Supplier-&-Product-Manager

First steps in the development of the Backend of a SPA application "supplier and Product Manager".

## Phases of Development

1. [Project Creation](#1project-creation)
2. [Database Configuration](#2database-configuration)
3. [First Entities](#3first-entities)
4. [JWT Authentication](#4jwt-authentication)
    1. [Refresh Token](#41refresh-token)
    2. [Project Deployment Start](#42project-deployment-start)
5. [Authentication System](#5authentication-system)

---------------------------------------------------------------------------------------

* We will create the project through the console command: `composer create-project symfony/skeleton Symfony-4-Supplier-&-Product-Manager`

---------------------------------------------------------------------------------------

## Summary Symfony component`s to use

* Server Component, `composer require server --dev`
* Twig Component, `composer require twig`
* Doctrine Component, `composer require doctrine maker`
* Form Componente, `composer require form`
* Security Component, `composer require security`
* Validator Component, `composer require validator`
* Rest-bundle, `composer require friendsofsymfony/rest-bundle`

## Summary Console command`s to be used

* `php bin/console doctrine:database:create`

* `php bin/console doctrine:schema:update --force`
* `php bin/console doctrine:schema:validate`, validate database and entities.

* `php bin/console doctrine:mapping:import App\\Entity yaml --path=config/doctrine`, to generate the metadata files into XML or YAML (source [How to Generate Entities from an Existing Database](https://symfony.com/doc/current/doctrine/reverse_engineering.html).
* `php bin/console doctrine:mapping:import App\\Entity annotation --path=src/Entity`, this command line tool asks Doctrine to introspect the database and generate new PHP classes with annotation metadata into src/Entity (source [How to Generate Entities from an Existing Database](https://symfony.com/doc/current/doctrine/reverse_engineering.html).
* `php bin/console make:entity --regenerate App`, generates getter/setter methods [Generating the Getters & Setters or PHP Classes](https://symfony.com/doc/current/doctrine/reverse_engineering.html#generating-the-getters-setters-or-php-classes).

* `php bin/console debug:container`, show all service of app.
* `php > var_export(DateTimeZone::listIdentifiers());`

--------------------------------------------------------------------------------------------

## 1.Project Creation

--------------------------------------------------------------------------------------------

1. Created our project using the Console command's, 

```bash
composer create-project symfony/skeleton Symfony-4-Supplier-&-Product-Manager
```

2. In the next step we will access the project folder using:

```bash
cd Symfony-4-Supplier-&-Product-Manager
```

3. Now we will install some minimum components for the development of the application.

* [Server Component](https://symfony.com/doc/current/setup.html), `composer require server --dev`
* [Profiler Component](https://symfony.com/doc/current/profiler.html), `composer require --dev profiler`

4. We can now access the basic installation by running, `php bin/console server:run`.

--------------------------------------------------------------------------------------------

## 2.Database Configuration

--------------------------------------------------------------------------------------------

1. We will installed **Doctrine Component** to manage the database of project using the command:

```bash
composer require doctrine maker
```

2. To configurate the database connection, we will modified the environment variable called `DATABASE_URL`. For then, we you can find and customize this inside [.env](../../.env):

_[.env](../../.env)_
```diff
# .env
###> doctrine/doctrine-bundle ###
# Format described at http://docs.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/configuration.html#connecting-using-a-url
# For an SQLite database, use: "sqlite:///%kernel.project_dir%/var/data.db"
# Configure your db driver and server_version in config/packages/doctrine.yaml
# DATABASE_URL=mysql://db_user:db_password@127.0.0.1:3306/db_name
++ DATABASE_URL=mysql://root:@127.0.0.1:3306/Symfony-4-Supplier-&-Product-Manager
++ # db_user: root
++ # db_password: 
++ # db_name: Symfony-4-Supplier-&-Product-Manager
# to use sqlite:
# DATABASE_URL="sqlite:///%kernel.project_dir%/var/app.db"
###< doctrine/doctrine-bundle ###
```

(Source: [https://symfony.com/doc/current/doctrine.html#configuring-the-database](https://symfony.com/doc/current/doctrine.html#configuring-the-database))

> We can see this default configuration of the database in _[.env.dist](../../.env.dist)_

3. In console lunch the command `php bin/console doctrine:database:create`. Now you have your data base created in your local server.

4. If you want to use XML instead of `yaml`, add `type: yml` and `dir: '%kernel.project_dir%/config/doctrine'` to the entity mappings in your [config/packages/doctrine.yaml](../../config/packages/doctrine.yaml) file.

_[config/packages/doctrine.yaml](../../config/packages/doctrine.yaml)_
```yml
doctrine:
    # ...
    orm:
        # ...
        mappings:
            App:
                is_bundle: false
                # type: annotation
                type: yml
                # dir: '%kernel.project_dir%/src/Entity'
                dir: '%kernel.project_dir%/config/doctrine'
                prefix: 'App\Entity'
                alias: App
```

(Source: [https://symfony.com/doc/current/doctrine.html](https://symfony.com/doc/current/doctrine.html))


--------------------------------------------------------------------------------------------

## 3.First entities

--------------------------------------------------------------------------------------------

1. We created the first entities:

* **User Entity**, [src/Entity/User.php](../../src/Entity/User.php) and [config/doctrine/User.orm.yml](../.
./config/doctrine/User.orm.yml)
* **ListRole Entity**, [src/Entity/ListRole.php](../../src/Entity/ListRole.php) and [config/doctrine/ListRole.orm.yml](../.
./config/doctrine/ListRole.orm.yml)
* **UserRole Entity**, [src/Entity/UserRole.php](../../src/Entity/UserRole.php) and [config/doctrine/UserRole.orm.yml](../.
./config/doctrine/UserRole.orm.yml)
* **ListGender Entity**, [src/Entity/ListGender.php](../../src/Entity/ListGender.php) and [config/doctrine/ListGender.orm.yml](../.
./config/doctrine/ListGender.orm.yml)

2. Execute the command `php bin/console doctrine:schema:update --force` to create the tables in the database.

> From now on, every change in the entities will be checked by the console command `php bin/console doctrine:schema:validate`.

--------------------------------------------------------------------------------------------

## 4.JWT Authentication 

--------------------------------------------------------------------------------------------

1. We will installed the next bundles for our system JWT Authentication.

* [LexikJWTAuthenticationBundle](https://github.com/lexik/LexikJWTAuthenticationBundle), using the next command to install it `composer require lexik/jwt-authentication-bundle`.
* [lcobucci/jwt](https://github.com/lcobucci/jwt), using the next command to install it `composer require lcobucci/jwt`, complementary library for use with lexik / jwt-authentication-bundle to provide many more encoders for json web tokens to generate.
* [jms/serializer-bundle](https://github.com/schmittjoh/JMSSerializerBundle), using the next command to install it `composer require jms/serializer-bundle`, Bundle that allows us to serialize our output data in a customized format (xml, json, among others). 
> This, (jms/serializer-bundle), is a contributed package, to be able to use it you have to allow Symfony Flex to use it, if we have not done it before `composer config extra.symfony.allow-contrib true`.
* [friendsofsymfony/rest-bundle](https://github.com/FriendsOfSymfony/FOSRest), using the next command to install it `composer require friendsofsymfony/rest-bundle`. 
* [sensio/framework-extra-bundle](https://symfony.com/doc/current/bundles/SensioFrameworkExtraBundle/index.html), using the next command to install it `composer require sensio/framework-extra-bundle`. 

> The file has been modified, [config/bundles.php](../../config/bundles.php), by adding the bundle.

_[config/bundles.php](../../config/bundles.php)_
```diff
<?php
return [
    Symfony\Bundle\FrameworkBundle\FrameworkBundle::class => ['all' => true],
    Symfony\Bundle\SecurityBundle\SecurityBundle::class => ['all' => true],
++  Lexik\Bundle\JWTAuthenticationBundle\LexikJWTAuthenticationBundle::class => ['all' => true],
];
```

> And _[.env](../../.env)_ to include the global variables of the bundle.

_[.env](../../.env)_
```diff
###> lexik/jwt-authentication-bundle ###
# Key paths should be relative to the project directory
# JWT_PRIVATE_KEY_PATH=%kernel.project_dir%/config/jwt/private.pem
JWT_PRIVATE_KEY_PATH=config/jwt/private.pem
# JWT_PUBLIC_KEY_PATH=%kernel.project_dir%/config/jwt/public.pem
JWT_PUBLIC_KEY_PATH=config/jwt/public.pem
JWT_PASSPHRASE=99edbbde72758541bc137263a226f5b5
JWT_TOKENTTL=3600
###< lexik/jwt-authentication-bundle ###
```

2. Generate the SSH keys :

```bash
mkdir -p config/jwt # For Symfony4, no need of the -p option
openssl genrsa -out config/jwt/private.pem -aes256 4096
openssl rsa -pubout -in config/jwt/private.pem -out config/jwt/public.pem
```

3. We'll also have to configure the bundle in [config/packages/lexik_jwt_authenticantion.yaml](../../config/packages/lexik_jwt_authenticantion.yaml).

_[config/packages/lexik_jwt_authenticantion.yaml](../../config/packages/lexik_jwt_authenticantion.yaml)_
```diff
++ # https://github.com/lexik/LexikJWTAuthenticationBundle
lexik_jwt_authentication:
--  secret_key: '%env(resolve:JWT_SECRET_KEY)%'
++  private_key_path: '%kernel.project_dir%/%env(JWT_PRIVATE_KEY_PATH)%'
--  public_key: '%env(resolve:JWT_PUBLIC_KEY)%'
++  public_key_path:  '%kernel.project_dir%/%env(JWT_PUBLIC_KEY_PATH)%'
    pass_phrase: '%env(JWT_PASSPHRASE)%'
++  token_ttl:        '%env(JWT_TOKENTTL)%'
++  # key under which the user identity will be stored in the token payload
++  user_identity_field: username
++  encoder:
++      service: lexik_jwt_authentication.encoder.lcobucci
++      signature_algorithm: RS512   
++  token_extractors:
++      authorization_header:      # look for a token as Authorization Header
++          enabled: true
++          prefix:  Bearer
++          name:    Authorization    
```

4. We configure the security of the application.

_[config/packages/security.yaml](../../config/packages/security.yaml)_
```diff
security:
++  # http://symfony.com/doc/current/security/named_encoders.html
++  encoders:
++      App\Entity\User:
++          algorithm: sha512
    # https://symfony.com/doc/current/security.html#where-do-users-come-from-user-providers
    providers:
--      in_memory: { memory: ~ }
++      # in_memory: { memory: ~ }
++      api_user_provider:
++          entity:
++              class: App\Entity\User
++              property: username
    firewalls:
        dev:
            pattern: ^/(_(profiler|wdt)|css|images|js)/
            security: false
        main:
--          anonymous: true
++          # anonymous: true

            # activate different ways to authenticate

            # http_basic: true
            # https://symfony.com/doc/current/security.html#a-configuring-how-your-users-will-authenticate

            # form_login: true
            # https://symfony.com/doc/current/security/form_login_setup.html
++      login:
++          pattern:  ^/api/login
++          stateless: true
++          anonymous: true
++          form_login:
++              check_path:               /api/login_check
++              success_handler:          lexik_jwt_authentication.handler.authentication_success
++              failure_handler:          lexik_jwt_authentication.handler.authentication_failure
++              # field names for the username and password fields
++              # value username_parameter default _username                
++              username_parameter: username
++              password_parameter: password
++              require_previous_session: false
++      api:
++          pattern:   ^/api/auth
++          stateless: true
++          anonymous: false
++          provider: api_user_provider
++          guard:
++              authenticators:
++                  - lexik_jwt_authentication.jwt_token_authenticator
    # Easy way to control access for large sections of your site
    # Note: Only the *first* access control that matches will be used
    access_control:
        # - { path: ^/admin, roles: ROLE_ADMIN }
        # - { path: ^/profile, roles: ROLE_USER }
++      - { path: ^/api/login_check, roles: IS_AUTHENTICATED_ANONYMOUSLY }
++      - { path: ^/api/login, roles: IS_AUTHENTICATED_ANONYMOUSLY }
++      - { path: ^/api/signup, roles: IS_AUTHENTICATED_ANONYMOUSLY }     
++      - { path: ^/api/auth,       roles: IS_AUTHENTICATED_FULLY }        
```

--------------------------------------------------------------------------------------------

## 4.1.Refresh Token 

--------------------------------------------------------------------------------------------

1. We will installed the next bundles for our system RefreshToken.

* [JWTRefreshTokenBundle](https://github.com/gesdinet/JWTRefreshTokenBundle), using the command `composer require gesdinet/jwt-refresh-token-bundle`. 

> The file has been modified, [config/bundles.php](../../config/bundles.php), by adding the bundle.

_[config/bundles.php](../../config/bundles.php)_
```diff
<?php
return [
    Symfony\Bundle\FrameworkBundle\FrameworkBundle::class => ['all' => true],
    Symfony\Bundle\SecurityBundle\SecurityBundle::class => ['all' => true],
    Lexik\Bundle\JWTAuthenticationBundle\LexikJWTAuthenticationBundle::class => ['all' => true],
++  Gesdinet\JWTRefreshTokenBundle\GesdinetJWTRefreshTokenBundle::class => ['all' => true],
];
```

2. Create the file [config/packages/gesdinet_jwt_refresh_token.yaml](../../config/packages/gesdinet_jwt_refresh_token.yaml) to configure the bundle

_[config/packages/gesdinet_jwt_refresh_token.yaml](../../config/packages/gesdinet_jwt_refresh_token.yaml)_
```yaml
# https://packagist.org/packages/gesdinet/jwt-refresh-token-bundle
# https://packagist.org/packages/gesdinet/jwt-refresh-token-bundle
gesdinet_jwt_refresh_token:
    # You can define Refresh Token TTL. Default value is 1 month.
    ttl: 2592000 
    # You can expand Refresh Token TTL on refresh. Default value is false.              
    # ttl_update: false
    # You can define your own UserProvider. By default we use our custom UserProvider.
    # user_provider: fos_user.user_provider.username_email
    # You can change user identity field. 
    # Make sure that your model user has getter for this field. Default value is username.    
    user_identity_field: username      
    # You can define Firewall name. Default value is api. 
    firewall: api/auth
```

3. We modify the security settings of the project.

_[config/packages/security.yaml](../../config/packages/security.yaml)_
```diff
security:
    # http://symfony.com/doc/current/security/named_encoders.html
    encoders:
        App\Entity\User:
            algorithm: sha512
    # https://symfony.com/doc/current/security.html#where-do-users-come-from-user-providers
    providers:
       # in_memory: { memory: ~ }
        api_user_provider:
            entity:
                class: App\Entity\User
                property: username
    firewalls:
++      refresh:
++          pattern:  ^/api/token/refresh
++          stateless: true
++          anonymous: true 
# ...
    access_control:
        - { path: ^/api/login_check, roles: IS_AUTHENTICATED_ANONYMOUSLY }
        - { path: ^/api/login, roles: IS_AUTHENTICATED_ANONYMOUSLY }
        - { path: ^/api/signup, roles: IS_AUTHENTICATED_ANONYMOUSLY }
++      - { path: ^/api/token/refresh, roles: IS_AUTHENTICATED_ANONYMOUSLY }      
        - { path: ^/api/auth,       roles: IS_AUTHENTICATED_FULLY }
```

--------------------------------------------------------------------------------------------

## 4.2.Project Deployment Start

--------------------------------------------------------------------------------------------

* [The Dotenv Component](http://symfony.com/doc/current/components/dotenv.html), `composer require symfony/dotenv`

_[composer.json](../../composer.json)_
```diff
// ...
         "post-install-cmd": [
++          "php bin/console app:deploy",
            "@auto-scripts"
         ],
         "post-update-cmd": [
            "@auto-scripts"
         ]
     },
// ...
```

_[src/Command/DeployCommand.php](../../src/Command/DeployCommand.php)_
```php
<?php

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
            if( !is_dir(directory) ){
                mkdir('config/jwt', 0777, true);
                $output->writeln([
                    'Folder no exists.',
                    'Creating...',
                ]);
            }
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
```

--------------------------------------------------------------------------------------------

## 5.Authentication System

--------------------------------------------------------------------------------------------

1. We will need to install the following bundle to manage the api, `composer require friendsofsymfony/rest-bundle`

( Source: [FriendsOfSymfony/FOSRestBundle](https://github.com/FriendsOfSymfony/FOSRestBundle) and [Getting Started With FOSRestBundle](http://symfony.com/doc/master/bundles/FOSRestBundle/index.html))

2. We can see the registry system in the following files.

* [src/Resources/config/routing/authentication.yml](../../src/Resources/config/routing/authentication.yml), for routing.
* [src/Controller/AuthenticationController.php](../../src/Controller/AuthenticationController.php), for the controller.
