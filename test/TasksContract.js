//Primero tenemos que llamar a nuestro contrato

const TasksContract = artifacts.require("TasksContract"); 

contract("TasksContract", () => {

    //Antes de que empiece cualquier otro testing, debes llamar a un código, con un await, el taskcontract que has importado. 

    before (async () => {
        this.tasksContract = await TasksContract.deployed();
    })

    it('migrate deployed succesfully', async () => {
        const address = this.tasksContract.address

        assert.notEqual(address, null); //Que address no sea igual a null. 
        assert.notEqual(address, undefined);
        assert.notEqual(address, 0x0);
        assert.notEqual(address, ""); 
    })
})