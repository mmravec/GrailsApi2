package user

import company.Company


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
        def userFound = User.findById(user?.id)
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
            u.setFirstName(params?.firstName)
            u.setLastName(params?.lastName)
            u.setAge(params?.age)
            u.setCountry(params?.country)
            u.setCompany(Company.findById(params?.companyId))
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
        render view:"/viewUsers/list", model: [users:us]
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

