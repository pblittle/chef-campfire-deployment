# encoding: utf-8

name 'campfire-deployment-test'
maintainer 'P. Barrett Little'
maintainer_email 'barrett@barrettlittle.com'
license 'Apache 2.0'
description 'Campfire deployment notifications'
long_description IO.read(
  File.join(
    File.dirname(__FILE__),
    'README.md'
  )
)
version '0.1.0'

supports 'centos'
supports 'debian'
supports 'ubuntu'

depends 'campfire-deployment'
