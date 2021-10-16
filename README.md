**Install Jenkins**
 
 Windows:
 
        Download windows Jenkins installer and follow the onscreen instructions
        https://www.jenkins.io/download/#downloading-jenkins
    
 Linux:
       debian/Ubuntu:
       
      
          wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
          sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
          /etc/apt/sources.list.d/jenkins.list'
          sudo apt-get update
          sudo apt-get install jenkins
      
         
 Mac:  
      
    
       brew install jenkins-lts
    

Jenkins can be accessed from http://localhost:8080. For the first time Jenkins will generate password and input that password as shown below

![image](https://user-images.githubusercontent.com/20655128/137576275-afd2366c-393e-4e39-a121-e334187d95fd.png)

We can now Customize Jenkins and install some plugins. For now we’re going to choose Install suggested plugins.

![image](https://user-images.githubusercontent.com/20655128/137576297-67089540-525d-4c73-b889-58a6e064eda2.png)


create a admin account in the next step 


![image](https://user-images.githubusercontent.com/20655128/137576318-e192b8fe-769f-4199-a55b-2344ab8daf3e.png)


Login Screen

![image](https://user-images.githubusercontent.com/20655128/137576345-d7dd384d-72d7-487a-88fe-2c17bdd648a4.png)


**Install Vagrant**

Windows:
    Download windows installer and follow onscreen instructions
    https://releases.hashicorp.com/vagrant/2.2.18/vagrant_2.2.18_x86_64.msi
    
Linux:

     ubuntu:
     curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
     sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
     sudo apt-get update && sudo apt-get install vagrant

Mac:
   
   ```
    brew install vagrant
   ```
   
**Install Oracle Virtual Box**

Windows:

   ```
   download windows installer and follow onscreen instructions
   https://download.virtualbox.org/virtualbox/6.1.26/VirtualBox-6.1.26-145957-Win.exe
   ```

   
Mac:
   ```
   Download https://download.virtualbox.org/virtualbox/6.1.26/VirtualBox-6.1.26-145957-OSX.dmg and install.
   ```




After installtions are done run below commands . Vagrant will spin up unix ubuntu vm 

         ```
          vagrant up
      
          vagrant ssh
        
         ```
 Add vagrant machine as node in jenkins
 
 click on Manage Jenkins 
 
 ![image](https://user-images.githubusercontent.com/20655128/137575520-04a9d2c7-3b74-49f0-b904-3b454b009eb9.png)

Select Manage Nodes and Clouds

![image](https://user-images.githubusercontent.com/20655128/137575551-a81b8a72-47e2-4bd1-9d38-c343c874b6d2.png)

click on New Node and give a name to node.
 1> click Ok
![image](https://user-images.githubusercontent.com/20655128/137575569-ff2de23b-3c1b-46ee-bc5d-2f102db61015.png)
In Next screen 
update home directory -> /home/vagrant
       labels -> stage
       launch method -> launch agents via ssh
       host -> localhost
       credntials -> Add creditnitals as vagrant user name and password as vagrant
       
       click on Advanced and update ssh port from 22 to 22222
       
![image](https://user-images.githubusercontent.com/20655128/137575708-65bf2327-3ca9-4ed7-9b97-db6c92c7a8eb.png)

and save. Jenkins will try to connect to the node. We will be using this node in the pipeline to run our builds,test and deploy



**Create a Pipeline**

![image](https://user-images.githubusercontent.com/20655128/137576357-a03e7b3b-ead4-4491-861a-6d3e84250e96.png)


![image](https://user-images.githubusercontent.com/20655128/137576376-5ed00f14-b96f-4732-8637-b98a90a96212.png)

![image](https://user-images.githubusercontent.com/20655128/137576400-2845023f-9903-45e9-aab9-f9301edb1063.png)


![image](https://user-images.githubusercontent.com/20655128/137576406-86815a00-121b-4f96-8fbc-333b073f5797.png)

Select Pipeline script from Scm 
select scm -> git, input gitrepository url -> https://github.com/reddeppas/jenkins_pipeline_as_code.git

update branches from master -> main

![image](https://user-images.githubusercontent.com/20655128/137576566-4bc8e8de-8cb7-49fd-9504-edcd80545d06.png)



![image](https://user-images.githubusercontent.com/20655128/137576415-0bbb7feb-6a1d-4f7c-b904-9e16b2f7d29b.png)





step6: Click on Build Now

![image](https://user-images.githubusercontent.com/20655128/137576769-ba402d64-1e89-414f-a6d1-4941e9dfe112.png)


**Plugins**

code coverage:
 cobertura 
 code coverage API 
Post Build Task
SSH Build Agents plugin
Gradle


