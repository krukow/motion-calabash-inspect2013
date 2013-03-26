motion-calabash-inspect2013
===========================

Calabash-RubyMotion Sample from Inspect2013 conference

To try

    git submodule update --init
    cp -R features RubyMotionSamples/Beers
    cd RubyMotionSamples/Beers/
    gem install motion-calabash


Edit `Rakefile` and add the line `require 'motion-calabash'` below `require 'motion/project'`.

Build

    rake build

Run test

    rake calabash:run

(make sure the iOS Simulator isn't hidden behind some other window).

To run on a USB-connected device, make sure the device is enabled for development, and you have an appropriate provisioning profile. For example, I have

    Motion::Project::App.setup do |app|
      app.name = 'Beers'
      app.frameworks += ['CoreLocation', 'MapKit', 'AddressBook']
      app.codesign_certificate = "iPhone Developer: Karl Krukow (6GF49ATP5N)"
      app.deployment_target = "5.0"
      app.provisioning_profile="/Users/krukow/ios_profiles/6EFC102C-1911-48B2-B0AF-5DB3923210E3.mobileprovision"
    end

Then run

    rake calabash:run device

Be sure to check out the documentation for [motion-calabash](https://github.com/calabash/motion-calabash).
