 
class project::jenkins_main  
   {



require pkg::python::pip
  package {['java-1.8.0-openjdk','java-1.8.0-openjdk-devel']: 
        ensure => installed,
    }
 

# ---------------------------------------------------------------------------- 
# Installing Jenkins

 
    
        exec { 'install jenkins repo':
         path    => '/bin:/usr/bin',
    command => 'wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo',
  }
  
   
   
   exec { 'install jenkins keys':
         path    => '/bin:/usr/bin',
    command => 'rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key',
  }
  
  
 package {['jenkins']: 
        ensure => installed,
    }
    
    
    	service { "jenkins":
		ensure => running,
		enable => true,
	}
    
 
  


 

# ----------------------------------------------------------------------------
# Add any additional settings *above* this comment block.
# ----------------------------------------------------------------------------

   
}
