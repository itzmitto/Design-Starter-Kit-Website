pub type Category {
  All
  Buttons
  Cards
  Forms
}

pub type Model {
  Model(
    filter: Category,
    name: String,
    email: String,
    terms_accepted: Bool,
    updates_enabled: Bool,
    loading: Bool,
    last_action: String,
  )
}

pub type Message {
  FilterChanged(Category)
  NameChanged(String)
  EmailChanged(String)
  TermsChanged(Bool)
  UpdatesChanged(Bool)
  LoadingStarted
  LoadingReset
  ActionSelected(String)
}

pub fn init(_flags) {
  Model(
    filter: All,
    name: "",
    email: "",
    terms_accepted: False,
    updates_enabled: True,
    loading: False,
    last_action: "",
  )
}

pub fn update(model: Model, message: Message) -> Model {
  case message {
    FilterChanged(filter) -> Model(..model, filter: filter)
    NameChanged(name) -> Model(..model, name: name)
    EmailChanged(email) -> Model(..model, email: email)
    TermsChanged(terms_accepted) ->
      Model(..model, terms_accepted: terms_accepted)
    UpdatesChanged(updates_enabled) ->
      Model(..model, updates_enabled: updates_enabled)
    LoadingStarted -> Model(..model, loading: True)
    LoadingReset -> Model(..model, loading: False)
    ActionSelected(action) -> Model(..model, last_action: action)
  }
}

pub fn category_name(category: Category) -> String {
  case category {
    All -> "All components"
    Buttons -> "Buttons"
    Cards -> "Cards"
    Forms -> "Forms"
  }
}
