struct Philosopher {
    name: String
}

impl Philosopher {
    fn new(name: &str) -> Philosopher {
        Philosopher {
            name: name.to_string(),
        }
    }

    fn eat(&self) {
        println!("{} is done eating.", self.name);
    }
}

fn main() {
    /*
    let p1 = Philosopher::new('J1');
    let p2 = Philosopher::new('J2');
    let p3 = Philosopher::new('J3');
    let p4 = Philosopher::new('J4');
    let p5 = Philosopher::new('J5');
    */

    let philosophers = vec![
        Philosopher::new("p1"),
        Philosopher::new("p2"),
        Philosopher::new("p3"),
        Philosopher::new("p4"),
        Philosopher::new("p5"),
    ];

    for p in &philosophers {
        p.eat();
    }
}
