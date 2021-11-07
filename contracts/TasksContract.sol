// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6; 

//creamos nuestro primer contrato:

contract TasksContract {

    //declaramos un taskCounter para que el id se genere automáticamente sin necesidad de tener que modificarlo de maneera manual. 

    uint taskCounter = 0; 


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


    //Esta función lo que nos dice como son las tareas que estoy creando, con que id, que título, que descripción, la condición inicial de si está hecha o no, y un timestamp, es decir, cuando fue creada. 
    function createTask (string memory _title, string memory _description) public { //Public es una palabra clave que nos permite acceder a la función desde FUERA de la blockchain. Hay otras palabras clave tmb, como View, que nos permite leer pero no manipular. 
            tasks[taskCounter] = Task(taskCounter, _title, _description, false, block.timestamp); 
            taskCounter++; 

    }

   /*  function toggleDone() {} */

}
