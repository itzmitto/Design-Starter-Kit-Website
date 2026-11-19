import lustre
import lustre/attribute.{attribute, class, href}
import lustre/element.{text}
import lustre/element/html.{a, div, footer, h1, h2, h3, header, main, nav, p, section, span}

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
  div([], [
    header([class("site-header")], [
      div([class("site-header__inner")], [
        a([class("brand"), href("#home")], [
          span([class("brand__mark")], [text("DS")]),
          text("Design Starter Kit"),
        ]),
        nav([class("nav")], [
          a([class("is-active"), href("#home")], [text("Home")]),
          a([href("#components")], [text("Components")]),
          a([href("#about")], [text("About")]),
        ]),
      ]),
    ]),
    main([], [
      section([class("hero"), attribute("id", "home")], [
        div([], [
          p([class("hero__eyebrow")], [text("A thoughtful UI library")]),
          h1([], [text("A better starting point for every interface.")]),
          p([class("hero__description")], [text("Explore a growing collection of practical, polished components built to make your next design feel clear and considered.")]),
          a([class("button"), href("#components")], [
            text("Explore components"),
            span([], [text("→")]),
          ]),
        ]),
        div([class("hero__preview")], [
          div([class("preview__topline")], [
            div([class("preview__dots")], [span([], []), span([], []), span([], [])]),
            text("COMPONENT PREVIEW"),
          ]),
          div([class("preview__card")], [
            p([class("preview__label")], [text("BUTTON STYLES")]),
            a([class("button button--small"), href("#components")], [text("Primary action")]),
            div([class("preview__row")], [
              a([class("button button--small button--outline"), href("#components")], [text("Secondary")]),
              text("Clear, useful, reusable."),
            ]),
            div([class("preview__swatches")], [span([], []), span([], []), span([], []), span([], [])]),
          ]),
        ]),
      ]),
      section([class("categories"), attribute("id", "components")], [
        div([class("categories__inner")], [
          div([class("categories__heading")], [
            h2([], [text("Start with the essentials")]),
            p([], [text("A small, useful set of foundations for interfaces that feel consistent from the first click.")]),
          ]),
          div([class("categories__grid")], [
            category_card("B", "Buttons", "Thoughtful actions with clear hierarchy, states, and accessible focus."),
            category_card("C", "Cards", "Flexible surfaces to organize content without adding visual noise."),
            category_card("F", "Forms", "Friendly fields and controls that make input feel straightforward."),
          ]),
        ]),
      ]),
    ]),
    footer([class("site-footer"), attribute("id", "about")], [
      p([], [text("© 2026 Design Starter Kit")]),
      p([], [text("Made for clear, considered interfaces.")]),
    ]),
  ])
}

fn category_card(icon: String, title: String, description: String) {
  a([class("category-card"), href("#components")], [
    span([class("category-card__icon")], [text(icon)]),
    h3([], [text(title)]),
    p([], [text(description)]),
    span([class("category-card__link")], [text("Browse collection →")]),
  ])
}
