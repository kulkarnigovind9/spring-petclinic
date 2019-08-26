node {

   stage('Clone Repository') {
        git 'https://github.com/kulkarnigovind9/spring-petclinic.git'
   }
   
   stage('Build App') {
       sh 'mvn clean install'
   }
   
   stage('Build Docker Image'){
       docker.build("kulkarnigovind/petclinic:$BUILD_NUMBER")
   }
   
   stage('Push Image') {
    withDockerRegistry([ credentialsId: "docker-hub-credetials", url: "" ]) {
      sh 'docker push kulkarnigovind/petclinic:$BUILD_NUMBER'
    }
   }

   stage('Trigger CD Job'){
     build job: 'petclinic-ansible-CD', parameters: [string(name: 'IMAGE_TAG', value: "$BUILD_NUMBER")]
   }

}