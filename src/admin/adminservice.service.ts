import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm"
import { Repository } from 'typeorm'
import { User } from "./adminentity.entity"
import { Transform } from "class-transformer"
import { AdminForm } from "./adminform.dto";



@Injectable()
export class AdminService {

    
    constructor(
        @InjectRepository(User)
        private usersRepository: Repository<User>,
    ){} 

    getIndex():string { 
        return "Admin Index"; 

    }

    getAllUsers():any {
        return this.usersRepository.find()
    }

    getUserByID(id):any {   
        return this.usersRepository.findOneBy({ id })
        //return "the id is "+id;
    }

    blockUser(id):any {
        return this.usersRepository.update(id, {isblocked: true})
        return "the id "+ id + " is blocked";
    }

    addNewUser(mydto: AdminForm):any {
        const useracc = new User()
        useracc.name = mydto.name;
        useracc.email = mydto.email;
        useracc.password = mydto.password;
        useracc.isblocked = false;
        return this.usersRepository.save(useracc);
        //return "User with id " + mydto.id + ", name " + mydto.name + " & email " + mydto.email + " added"
    }

    deleteUser(qry):any {
        //const toDelete = this.usersRepository.findOneBy(qry.id)
        return this.usersRepository.delete(qry.id);
        //return "User with id " +qry.id + " deleted"
    }

    setPrice(price):any {
        return "New monthly subscription price is " + price + "BDT"
    }

    checkManagerRequests(): any {
        return "Manager requests(Production House Aprroval)"
    }

    removeShow(qry): any {
        return "Show " + qry.id + " Removed!"
    }

    payProductionHouse(id, amount): any {
        return amount + "BDT paid to " + id;
    }

}