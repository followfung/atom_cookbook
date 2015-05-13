default['atom']['mysql_version'] = '5.5'
default['atom']['mysql_password'] = 'password'
default['atom']['database_name'] = 'atom'
default['atom']['database_user'] = 'atom'
default['atom']['database_user_password'] = 'atom'
default['atom']['install_dir'] = '/var/www/html/atom'
default['atom']['git_repo'] = 'git://github.com/artefactual/atom.git'
default['atom']['git_revision'] = 'stable/2.1.x'

default['atom']['packages'] = %w{ poppler-utils ghostscript ffmpeg git }
case node['platform_family']
when 'rhel'
	default['atom']['packages'] += 'ImageMagick'
when 'debian', 'mac_os_x'
	default['atom']['packages'] += 'imagemagick'
end

 # AtoM requires Elasticsearch version ~> 1.3.0
default['elasticsearch']['version'] = '1.3.0'

# Elasticsearch requires java
default['java']['install_flavor'] = 'openjdk' 
default['java']['jdk_version'] = '7'

# less and gulp are required to compile the .less files
default['nodejs']['npm_packages'] = [
	{ "name" => "less" },
	{ "name" => "gulp" },
]

# TODO: make sure that these packages install properly on all platforms
# 		php-pecl-apc works on Fedora20, but I'm not sure if it will work
# 		on other platform families
default['php']['packages'] += %w{ php-pecl-apc php-mbstring }

default['apache']['default_modules'] += %w{ php5 }