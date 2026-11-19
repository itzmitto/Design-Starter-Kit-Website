import design_starter_kit_website/state.{
  type Category, type Model, ActionSelected, All, Buttons, Cards, EmailChanged,
  FilterChanged, Forms, LoadingReset, LoadingStarted, NameChanged, TermsChanged,
  UpdatesChanged,
}
import lustre/attribute.{
  attribute, autocomplete, checked, class, disabled, href, id, placeholder,
  required, src, type_, value,
}
import lustre/element.{text}
import lustre/element/html.{
  a, article, button, div, h2, h3, img, input, label, p, section, small, span,
  strong,
}
import lustre/event.{on_check, on_click, on_input}

pub fn filter_toolbar(active: Category) {
  div([class("filter-bar"), attribute("aria-label", "Filter components")], [
    filter_button(All, "All components", active),
    filter_button(Buttons, "Buttons", active),
    filter_button(Cards, "Cards", active),
    filter_button(Forms, "Forms", active),
  ])
}

fn filter_button(category: Category, title: String, active: Category) {
  let is_active = category == active
  let selected_class = case is_active {
    True -> " filter-chip--active"
    False -> ""
  }
  let pressed = case is_active {
    True -> "true"
    False -> "false"
  }
  button(
    [
      class("filter-chip" <> selected_class),
      attribute("aria-pressed", pressed),
      on_click(FilterChanged(category)),
    ],
    [text(title)],
  )
}

pub fn button_gallery(model: Model) {
  section([class("catalogue-section"), id("buttons")], [
    section_heading(
      "01",
      "Buttons",
      "Clear actions, with a style for every level of emphasis.",
    ),
    div([class("component-grid component-grid--buttons")], [
      preview_card(
        "Primary button",
        "For the main action on a page.",
        button(
          [
            class("ui-button ui-button--primary"),
            on_click(ActionSelected("Primary button")),
          ],
          [text("Get started")],
        ),
        "button",
      ),
      preview_card(
        "Secondary button",
        "A quieter action beside the primary.",
        button(
          [
            class("ui-button ui-button--secondary"),
            on_click(ActionSelected("Secondary button")),
          ],
          [text("Learn more")],
        ),
        "button",
      ),
      preview_card(
        "Outline button",
        "A crisp alternative with a visible border.",
        button(
          [
            class("ui-button ui-button--outline"),
            on_click(ActionSelected("Outline button")),
          ],
          [text("View details")],
        ),
        "button",
      ),
      preview_card(
        "Ghost button",
        "Low emphasis for compact toolbars.",
        button(
          [
            class("ui-button ui-button--ghost"),
            on_click(ActionSelected("Ghost button")),
          ],
          [text("More options")],
        ),
        "button",
      ),
      preview_card(
        "Loading button",
        "Try a short loading state, then reset it.",
        div([class("preview-stack")], [
          button(
            [
              class("ui-button ui-button--primary"),
              disabled(model.loading),
              on_click(LoadingStarted),
            ],
            [
              case model.loading {
                True -> text("Loading…")
                False -> text("Save changes")
              },
            ],
          ),
          case model.loading {
            True ->
              button([class("text-button"), on_click(LoadingReset)], [
                text("Reset preview"),
              ])
            False -> span([class("preview-hint")], [text("Click to preview")])
          },
        ]),
        "button",
      ),
    ]),
  ])
}

pub fn card_gallery() {
  section([class("catalogue-section"), id("cards")], [
    section_heading(
      "02",
      "Cards",
      "Flexible surfaces for content, people, and product highlights.",
    ),
    div([class("component-grid component-grid--cards")], [
      preview_card(
        "Simple card",
        "A compact surface for a short update.",
        simple_card(),
        "card",
      ),
      preview_card(
        "Image card",
        "A photo-led card with a clear text hierarchy.",
        image_card(),
        "card",
      ),
      preview_card(
        "Profile card",
        "A friendly introduction to a person or author.",
        profile_card(),
        "card",
      ),
      preview_card(
        "Feature card",
        "A little more room for a key benefit.",
        feature_card(),
        "card",
      ),
    ]),
  ])
}

pub fn form_gallery(model: Model) {
  section([class("catalogue-section"), id("forms")], [
    section_heading(
      "03",
      "Forms",
      "Comfortable, accessible controls with useful states.",
    ),
    div([class("component-grid component-grid--forms")], [
      preview_card(
        "Text input",
        "Label, hint, and a live value.",
        div([class("field-stack")], [
          label([class("field-label"), attribute("for", "sample-name")], [
            text("Full name"),
          ]),
          input([
            class("text-input"),
            id("sample-name"),
            type_("text"),
            autocomplete("name"),
            placeholder("e.g. Alex Morgan"),
            value(model.name),
            on_input(NameChanged),
          ]),
          small([class("field-hint")], [
            text("This is how your name will appear."),
          ]),
        ]),
        "form",
      ),
      preview_card(
        "Email input",
        "An email field with native validation.",
        div([class("field-stack")], [
          label([class("field-label"), attribute("for", "sample-email")], [
            text("Email address"),
          ]),
          input([
            class("text-input"),
            id("sample-email"),
            type_("email"),
            autocomplete("email"),
            placeholder("you@example.com"),
            value(model.email),
            on_input(EmailChanged),
          ]),
          small([class("field-hint")], [
            text("We’ll only use this to reply to you."),
          ]),
        ]),
        "form",
      ),
      preview_card(
        "Checkbox",
        "A native checkbox with a linked label.",
        label([class("check-row")], [
          input([
            type_("checkbox"),
            checked(model.terms_accepted),
            required(True),
            on_check(TermsChanged),
          ]),
          span([], [text("I agree to the terms and conditions")]),
        ]),
        "form",
      ),
      preview_card(
        "Toggle switch",
        "A switch to opt in or out of updates.",
        label([class("toggle-row")], [
          span([class("toggle-copy")], [
            strong([], [text("Product updates")]),
            small([class("field-hint")], [
              text("A short note when something new ships."),
            ]),
          ]),
          span([class("toggle")], [
            input([
              type_("checkbox"),
              checked(model.updates_enabled),
              on_check(UpdatesChanged),
            ]),
            span([class("toggle__track")], []),
          ]),
        ]),
        "form",
      ),
    ]),
    div([class("form-feedback"), attribute("aria-live", "polite")], [
      case model.name != "" || model.email != "" {
        True -> text("Your preview: " <> model.name <> " · " <> model.email)
        False -> text("Type in the fields above to preview their live state.")
      },
    ]),
  ])
}

fn section_heading(number: String, title: String, description: String) {
  div([class("catalogue-section__heading")], [
    span([class("section-number")], [text(number)]),
    div([], [h2([], [text(title)]), p([], [text(description)])]),
  ])
}

fn preview_card(title: String, description: String, preview, kind: String) {
  article([class("component-card")], [
    div([class("component-card__preview component-card__preview--" <> kind)], [
      preview,
    ]),
    div([class("component-card__meta")], [
      div([], [h3([], [text(title)]), p([], [text(description)])]),
      a(
        [
          class("code-link"),
          href("#" <> string_slug(title)),
          attribute("aria-label", "Jump to " <> title),
        ],
        [text("↗")],
      ),
    ]),
  ])
}

fn simple_card() {
  article([class("demo-card demo-card--simple")], [
    span([class("demo-card__tag")], [text("UPDATE")]),
    h3([], [text("A calmer workspace")]),
    p([], [
      text("Small improvements to help you focus on the work that matters."),
    ]),
    a([class("demo-link"), href("#about")], [text("Read the note →")]),
  ])
}

fn image_card() {
  article([class("demo-card demo-card--image")], [
    img([
      src("/images/workspace.jpg"),
      attribute("alt", "Workspace with computer, monitor, and desk accessories"),
    ]),
    div([], [
      span([class("demo-card__tag")], [text("STUDIO NOTES")]),
      h3([], [text("Room to think")]),
      p([], [text("A welcoming place for good ideas to take shape.")]),
    ]),
  ])
}

fn profile_card() {
  article([class("demo-card demo-card--profile")], [
    span([class("profile-avatar"), attribute("aria-hidden", "true")], [
      text("AM"),
    ]),
    div([class("profile-copy")], [
      h3([], [text("Alex Morgan")]),
      p([], [text("Product designer · Utrecht")]),
      small([class("field-hint")], [
        text("Design systems, coffee, and clear interfaces."),
      ]),
    ]),
  ])
}

fn feature_card() {
  article([class("demo-card demo-card--feature")], [
    span([class("feature-mark")], [text("✳")]),
    span([class("demo-card__tag")], [text("MADE FOR TEAMS")]),
    h3([], [text("A shared source of truth")]),
    p([], [text("Keep patterns consistent as your product grows.")]),
    div([class("feature-card__foot")], [
      span([], [text("Explore the system")]),
      span([], [text("→")]),
    ]),
  ])
}

fn string_slug(title: String) {
  case title {
    "Buttons" -> "buttons"
    "Cards" -> "cards"
    "Forms" -> "forms"
    _ -> "library"
  }
}
