maintainer       "Zühlke Engineering GmbH"
maintainer_email "tkn@zuehlke.com"
license          "All rights reserved"
description      "Installs/Configures myapp"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

%w{ apt postgresql tomcat database application_java }.each do |cb|
  depends cb
end
