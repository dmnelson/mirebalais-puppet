class mirebalais(
    $mysql_root_password = 'foo',
    $mysql_default_db = 'openmrs',
    $mysql_default_db_user = 'openmrs',
    $mysql_default_db_password = 'foo',
    $tomcat = 'tomcat6',
  ){

  include mirebalais::components::java
  include mirebalais::components::tomcat

  class { 'mirebalais::components::mysql':
    root_password => $mysql_root_password,
    default_db => $mysql_default_db,
    default_db_user => $mysql_default_db_user,
    default_db_password => $mysql_default_db_password 
  }

  include mirebalais::components::openmrs

  file { '/etc/environment':
    source => "puppet:///modules/mirebalais/etc/environment"
  }  

}

class { 'apt':
  always_apt_update    => true,
}
