use std::process::Command;
use std::{thread, time::Duration};

fn main() {
    let mut n: isize;
    let mut old_n: isize = 0;
    loop {
        thread::sleep(Duration::from_millis(35));
        n = 0;
        let output = Command::new("bspc")
                             .arg("query")
                             .arg("-N")
                             .arg("-d")
                             .output()
                             .expect("");
        let process_mem = String::from_utf8_lossy(&output.stdout);
        let process_mem = process_mem.split("\n");
        for _i in process_mem {
            n += 1;
        }
        if n != old_n {
            blur();
        }
        old_n = n;
    }
}

fn blur() {
    let mut n: isize = 0;
    let output = Command::new("bspc")
                         .arg("query")
                         .arg("-N")
                         .arg("-d")
                         .output()
                         .expect("");
    let process_mem = String::from_utf8_lossy(&output.stdout);
    let process_mem = process_mem.split("\n");
    for _i in process_mem {
        n += 1;
    }

    let monitor = Command::new("bspc")
                          .arg("query")
                          .arg("-M")
                          .arg("-d")
                          .arg("--names")
                          .output()
                          .expect("");
    let monitor = String::from_utf8_lossy(&monitor.stdout);
    println!("{}{}", monitor, n);

    if n >= 2 {
        println!("blurring");
        if monitor == "HDMI-1\n" {
            Command::new("nitrogen")
                    .arg("--head=1")
                    .arg("--set-zoom-fill")
                    .arg("/home/arnaud/Desktop/arnaud/img/night-city-blur.jpg")
                    .spawn();
            println!("hdmi-blur");
        }
        if monitor == "eDP-1\n" {
            Command::new("nitrogen")
                    .arg("--head=0")
                    .arg("--set-zoom-fill")
                    .arg("/home/arnaud/Desktop/arnaud/img/night-city-blur.jpg")
                    .spawn();
            println!("edp-blur");
        }
    }
    else {
        println!("unblurring");
        if monitor == "HDMI-1\n" {
            Command::new("nitrogen")
                    .arg("--head=1")
                    .arg("--set-zoom-fill")
                    .arg("/home/arnaud/Desktop/arnaud/img/night-city.jpg")
                    .spawn();
            println!("hdmi-unblur");
        }
        if monitor == "eDP-1\n" {
            Command::new("nitrogen")
                    .arg("--head=0")
                    .arg("--set-zoom-fill")
                    .arg("/home/arnaud/Desktop/arnaud/img/night-city.jpg")
                    .spawn();
            println!("edp-unblur");
        }
    }
    return();
}
