ARG VERSION_RUNNER=2.311.0-0

FROM mattermost/actions-runner:${VERSION_RUNNER}

ENV VERSION_RUNNER=${VERSION_RUNNER}
ENV VERSION_COMPOSER=2.6.6
ENV VERSION_PHPCS=3.7.2
ENV VERSION_PHPMD=2.14.1
ENV VERSION_PHPSTAN=1.10.50
ENV VERSION_PHPUNIT=10.5.3
ENV VERSION_PHPCOV=9.0.2
ENV VERSION_PHPLOC=7.0.2
ENV VERSION_PHPCPD=6.0.3

RUN sudo apt update

RUN sudo apt install software-properties-common -y; \
    sudo add-apt-repository ppa:ondrej/php; \
    sudo apt install  \
        php8.3-cli \
        php8.3-mbstring \
        php8.3-xml \
        php8.3-pcov \
        php8.3-xdebug \
        -y; \
    sudo apt purge php8.2*

RUN wget -c https://github.com/composer/composer/releases/download/${VERSION_COMPOSER}/composer.phar ; \
    sudo mv composer.phar /usr/local/bin/composer

RUN wget -c https://github.com/squizlabs/PHP_CodeSniffer/releases/download/${VERSION_PHPCS}/phpcbf.phar ; \
    sudo mv phpcbf.phar /usr/local/bin/phpcbf

RUN wget -c https://github.com/squizlabs/PHP_CodeSniffer/releases/download/${VERSION_PHPCS}/phpcs.phar ; \
    sudo mv phpcs.phar /usr/local/bin/phpcs

RUN wget -c https://github.com/phpmd/phpmd/releases/download/${VERSION_PHPMD}/phpmd.phar ; \
    sudo mv phpmd.phar /usr/local/bin/phpmd

RUN wget -c https://github.com/phpstan/phpstan/releases/download/${VERSION_PHPSTAN}/phpstan.phar ; \
    sudo mv phpstan.phar /usr/local/bin/phpstan

RUN wget -c https://phar.phpunit.de/phpunit-${VERSION_PHPUNIT}.phar ; \
    sudo mv phpunit-${VERSION_PHPUNIT}.phar /usr/local/bin/phpunit

RUN wget -c https://phar.phpunit.de/phpcov-${VERSION_PHPCOV}.phar ; \
    sudo mv phpcov-${VERSION_PHPCOV}.phar /usr/local/bin/phpcov

RUN wget -c https://phar.phpunit.de/phploc-${VERSION_PHPLOC}.phar ; \
    sudo mv phploc-${VERSION_PHPLOC}.phar /usr/local/bin/phploc

RUN wget -c https://phar.phpunit.de/phpcpd-${VERSION_PHPCPD}.phar ; \
    sudo mv phpcpd-${VERSION_PHPCPD}.phar /usr/local/bin/phpcpd

RUN sudo chmod a+x /usr/local/bin/*