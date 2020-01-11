use std::thread;
use std::time::Duration;

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
        println!("{} is eating.", self.name);
        thread::sleep(Duration::from_millis(1000));
        println!("{} is done eating.", self.name);
    }
}

fn main() {
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
