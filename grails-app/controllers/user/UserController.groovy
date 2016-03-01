package user

import org.springframework.dao.DataIntegrityViolationException

class UserController {
    ArrayList<User> userList = new ArrayList<User>()

    static scope ="session"

    static defaultAction = "initialize"

    def initialize(){
        render view: "/user/user"
    }

    def registerAgain(){
        render view: "/user/user"
    }

    def save(User user){
        /*
        User user = new User()

        user.properties = params
        try{
            userList.add(user)
            user.save()
            //user.findAll()
        }catch(Exception e){
            log.debug("Exception register USER: ", e)
            //print("Exception register USER: ", e)
        }
        redirect action: "listOfUsers"
        */
        def userFound = User.findById(user.id)
        if(userFound){
            if(user.validate()){
                user.save()
                redirect action: "listOfUsers"
            }
            else {
                render view: "/user/user", model: [user: user]
                return
            }

        }
        else {
            User u = new User()
            u.setFirstName(user?.firstName)
            u.setLastName(user?.lastName)
            u.setAge(user?.age)
            u.setCountry(user?.country)
            if(u.validate()){
                u.save()
                redirect action: "listOfUsers"
            }
            else {
                render view: "/user/user", model: [user: u]
                return
            }
        }


    }

    def listOfUsers(){
        def us = User.findAll()
        render view:"/viewUsers/list",model: [users:us]
    }
    def deleteListOfUsers(){
        def users = User.findAll()

        //it**
        users.each { user ->
            user.delete()
        }
        redirect action: "listOfUsers"
    }
    def deleteByIdUser(){
        def id = params.id
        def users = User.get(id)
        if(!users){
           flash.message = message(code: 'default.not.found.message', args: [message(default: 'User'), id])
           redirect action: "listOfUsers"
        } else{
            users.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(default: 'User'),id])
            redirect action: "listOfUsers"
        }
    }

    def editUser(){
        def id = params.id
        def user = User.get(id)
        render view: "/user/user", model: [user: user]
    }
}


/**
 *  def userDaoService //, grailsApplication
 def save(){
 // String meno = grailsApplication.config?.user?.meno
 def user = new User(params)
 user.save()
 render (view: "user", model: [user: user])
 }

 def showEvents() {
 def users = User.findAll()
 [users:users]
 }
 *
 */
