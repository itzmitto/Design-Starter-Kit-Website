import lustre
import lustre/element.{text}
import lustre/element/html.{main, h1, p}

pub fn main() {
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}

fn init(_flags) {
  Nil
}

type Message {
  NoOp
}

fn update(model, _message) {
  model
}

fn view(_model) {
  main([], [
    h1([], [text("Design Starter Kit")]),
    p([], [text("A home for reusable interface components and design examples.")]),
  ])
}
