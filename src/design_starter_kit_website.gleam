import lustre
import lustre/attribute.{attribute, class, href, id}
import lustre/element.{text}
import lustre/element/html.{a, div, footer, h1, h2, header, main as main_element, nav, p, section, small, span, strong}
import design_starter_kit_website/components
import design_starter_kit_website/state.{type Category, type Model, All, Buttons, Cards, Forms}

pub fn main() {
  let app = lustre.simple(state.init, state.update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}

fn view(model: Model) {
  div([class("app-shell")], [
    site_header(),
    main_element([], [
      hero(),
      div([class("library"), id("library")], [
        div([class("library__top")], [
          div([], [
            p([class("eyebrow")], [text("THE LIBRARY")]),
            p([class("library__count")], [text(component_count(model.filter))]),
          ]),
          components.filter_toolbar(model.filter),
        ]),
        div([class("library__sections")], sections_for(model)),
      ]),
      closing_note(),
    ]),
    site_footer(),
  ])
}

fn site_header() {
  header([class("site-header")], [
    div([class("site-header__inner")], [
      a([class("brand"), href("#top"), id("top")], [
        span([class("brand__mark")], [text("DS")]),
        span([], [text("Design Starter Kit")]),
      ]),
      nav([class("site-nav"), attribute("aria-label", "Main navigation")], [
        a([class("site-nav__link site-nav__link--active"), href("#library")], [text("Library")]),
        a([class("site-nav__link"), href("#buttons")], [text("Components")]),
        a([class("site-nav__link"), href("#about")], [text("About")]),
      ]),
      a([class("header-action"), href("#library")], [text("Explore library"), span([], [text("↗")])]),
    ]),
  ])
}

fn hero() {
  section([class("hero")], [
    div([class("hero__copy")], [
      p([class("eyebrow")], [span([class("eyebrow__dot")], []), text("A COMPONENT LIBRARY FOR THOUGHTFUL PRODUCTS")]),
      h1([class("hero__title")], [text("Good interfaces start with good details.")]),
      p([class("hero__description")], [text("A growing collection of useful, polished UI patterns. Explore the previews, try the controls, and find a solid starting point for your next idea.")]),
      a([class("ui-button ui-button--primary hero__cta"), href("#library")], [text("Browse the library"), span([], [text("↓")])]),
      div([class("hero__proof")], [
        span([class("proof-dot proof-dot--blue")], []),
        span([class("proof-dot proof-dot--green")], []),
        span([class("proof-dot proof-dot--orange")], []),
        text("Simple patterns. Thoughtfully made."),
      ]),
    ]),
    hero_artwork(),
  ])
}

fn hero_artwork() {
  div([class("hero-art")], [
    div([class("hero-art__top")], [
      span([], [text("YOUR NEXT STARTING POINT")]),
      span([class("hero-art__status")], [text("READY TO USE")]),
    ]),
    div([class("hero-art__window")], [
      div([class("hero-art__window-head")], [
        span([class("hero-art__avatar")], [text("S")]),
        div([], [strong([], [text("Soft forms")]), small([], [text("A little more human")])]),
        span([class("hero-art__menu")], [text("•••")]),
      ]),
      div([class("hero-art__field-label")], [text("YOUR EMAIL")]),
      div([class("hero-art__field")], [text("hello@yourstudio.com")]),
      div([class("hero-art__actions")], [
        span([class("hero-art__button")], [text("Continue")]),
        span([class("hero-art__hint")], [text("No spam, ever")]),
      ]),
    ]),
    div([class("hero-art__note hero-art__note--one")], [span([], [text("Aa")]), text("Clear type")]),
    div([class("hero-art__note hero-art__note--two")], [span([], [text("✳")]), text("Easy to adapt")]),
  ])
}

fn sections_for(model: Model) {
  case model.filter {
    All -> [components.button_gallery(model), components.card_gallery(), components.form_gallery(model)]
    Buttons -> [components.button_gallery(model)]
    Cards -> [components.card_gallery()]
    Forms -> [components.form_gallery(model)]
  }
}

fn component_count(filter: Category) {
  case filter {
    All -> "13 ready-to-explore components"
    Buttons -> "5 button patterns"
    Cards -> "4 card patterns"
    Forms -> "4 form controls"
  }
}

fn closing_note() {
  section([class("closing-note"), id("about")], [
    div([class("closing-note__mark")], [text("DS")]),
    div([], [
      p([class("eyebrow")], [text("MADE TO GROW WITH YOU")]),
      h2([], [text("A considered starting point for what comes next.")]),
    ]),
    p([class("closing-note__copy")], [text("Built with Gleam, Lustre, and a shared love of well-made interface details.")]),
  ])
}

fn site_footer() {
  footer([class("site-footer")], [
    div([class("site-footer__inner")], [
      a([class("brand brand--footer"), href("#top")], [
        span([class("brand__mark")], [text("DS")]),
        text("Design Starter Kit"),
      ]),
      p([], [text("A small library for building better interfaces." )]),
      span([], [text("© 2026 Design Starter Kit")]),
    ]),
  ])
}
