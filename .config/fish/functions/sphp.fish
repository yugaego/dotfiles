function sphp -d "Switch between Macports PHP 7 and PHP 8 packages"
    if set -q argv[1]

        # Set variables in accordance with the requested package number.
        set packageNum $argv[1]
        set package php"$argv[1]"
        set packageDisable (string sub -s -7 -l 5 (port select --show php))

        set module (string sub --length 4 $package)
        set moduleDisable "php"
        if not contains "php7" $module
            set module "php"
            set moduleDisable "php7"
        end

        # Switch to the requested PHP port.
        sudo port select php $package

        # Toggle Apache PHP module in use.
        set modulePath /opt/local/lib/apache2/modules/
        set apxsPath /opt/local/bin/apxs
        set ext "$modulePath"mod_"$package".so
        set extDisable "$modulePath"mod_"$packageDisable".so
        sudo "$apxsPath" -A -e -n $moduleDisable $extDisable
        sudo "$apxsPath" -a -e -n $module $ext
        sudo apachectl -k restart

        # Install Phpactor from branch that supports the requested PHP version.
        echo "Enabling corresponding Phpactor version."
        pushd ~/Sources/phpactor
        git switch $package
        composer install --prefer-dist -q
        popd

        echo (set_color cyan)"Finished enabling: "
        echo "$(php --version)"

        # Start Apache again, to make sure it's up and running.
        sudo apachectl -k start
    else
        echo "Enter Macports PHP package number to enable (f.i. 74 or 81)"
    end
end
