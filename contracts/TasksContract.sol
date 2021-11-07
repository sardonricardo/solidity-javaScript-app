// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6; 

//creamos nuestro primer contrato:

contract TasksContract {

    //declaramos un taskCounter para que el id se genere automáticamente sin necesidad de tener que modificarlo de maneera manual. 

    uint public taskCounter = 0; 

    //Un constructor en solidity, nos permite ejectura una porción de código la primera vez que se ejecuta el contrato. 
    constructor () {
        createTask("mi primera tarea de ejemplo", "tengo una tarea creada por defecto"); 

    }

    //declaramos las varaibles, mediante mapping. Un mapping sería tipo un schema de mongoose o sequelizer. 
    //Al estilo del schema de mongooso, tenemos otra palabra clave que se llama: 
    struct Task { //Declaración de los datos que tendrán las tareas que vamos a crear:
        uint256 id;
        string title;
        string description;
        bool done; //Si la tarea se ha hecho o no. 
        uint256 createdAt;

    }


    mapping (uint256 => Task) public tasks;  // Task = al nombre de la lista. Uint significa que los valores de la key serán enteros y nunca negativos. 


//FUNCIONES CRUD *********************************************
    //Esta función lo que nos dice como son las tareas que estoy creando, con que id, que título, que descripción, la condición inicial de si está hecha o no, y un timestamp, es decir, cuando fue creada. 
    function createTask (string memory _title, string memory _description) public { //Public es una palabra clave que nos permite acceder a la función desde FUERA de la blockchain. Hay otras palabras clave tmb, como View, que nos permite leer pero no manipular. 
            tasks[taskCounter] = Task(taskCounter, _title, _description, false, block.timestamp); 
            taskCounter++; 

    }

    function toggleDone(uint _id) public {
        Task memory _task = tasks[_id]; //para acceder a una tarea X y la guardamos en una variable. 
        _task.done = !_task.done; //Luego de la tarea guardada, cambiamos la propiedad done a su valor contrario. 
        tasks[_id] = _task; //y lo guardamos en una variable. 
    } 

}
