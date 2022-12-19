interface ISasha {
    drinkBeer(): void;
    program(): void;
}


class RealSasha implements ISasha {
    drinkBeer(): void {
        console.log("Gulp gulp gulp");
    }
    program(): void {
        console.log("Tap tap tap");
    }

}

function getSashaToDrinkAnotherBeer(sasha: ISasha){
    sasha.drinkBeer();
}


function programSomething(programmer: { program(what: Object): void }){
    programmer.program(new Object());
}


const sasha = new RealSasha();

programSomething(sasha);


getSashaToDrinkAnotherBeer(sasha);