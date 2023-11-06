-- typeform workspaces
create table if not exists typeform_workspaces (
  default boolean,

  id varchar,
  name varchar,

  account_id varchar,

  shared boolean,

  self_href varchar,

  forms_count integer,
  forms_href varchar,

  __hevo__ingested_at integer,
  __hevo__loaded_at integer,

  primary key (id)
);

-- typeform forms
create table if not exists typeform_forms (
  id varchar,
  title varchar,
  type varchar,

  created_at timestamp,
  last_updated_at timestamp,
  published_at timestamp,

  hidden array,
  variables array,
  welcome_screens array,
  thankyou_screens array,
  logic array,

  theme_href varchar,

  workspace_href varchar,

  _links_display varchar,
  _links_responses varchar,

  settings_language varchar,
  settings_is_public boolean,
  settings_autosave_progress boolean,
  settings_progress_bar varchar,
  settings_show_progress_bar boolean,
  settings_show_typeform_branding boolean,
  settings_show_time_to_complete boolean,
  settings_show_number_of_submissions boolean,
  settings_show_cookie_consent boolean,
  settings_show_question_number boolean,
  settings_show_key_hint_on_choices boolean,
  settings_hide_navigation boolean,
  settings_capabilities object,
  settings_meta object,

  settings_use_lead_qualification boolean,
  settings_is_trial boolean,
  settings_pro_subdomain_enabled boolean,
  settings_are_uploads_public boolean,
  settings_free_form_navigation boolean,

  __hevo__ingested_at integer,
  __hevo__loaded_at integer,

  primary key (id)
);

-- typeform formfields
create table if not exists typeform_formfields (
  id varchar,
  ref varchar,
  title varchar,
  type varchar,

  form_id varchar,
  form_title varchar,
  form_type varchar,

  properties_description varchar,
  properties_choices array,
  properties_fields array,
  properties_allow_multiple_selection boolean,
  properties_randomize boolean,
  properties_allow_other_choice boolean,
  properties_vertical_alignment boolean,
  properties_supersized boolean,
  properties_show_labels boolean,
  properties_hide_marks boolean,
  properties_button_text varchar,
  properties_steps integer,
  properties_labels object,
  properties_start_at_one boolean,
  properties_structure varchar,
  properties_separator varchar,
  properties_default_country_code varchar,
  properties_show_button boolean,

  validations_required boolean,
  validations_min_value integer,
  validations_min_selection integer,
  validations_max_selection integer,

  attachment_type varchar,
  attachment_href varchar,
  attachment_properties object,

  layout_type varchar,
  layout_placement varchar,
  layout_attachment object,

  __hevo__ingested_at integer,
  __hevo__loaded_at integer,

  primary key (form_id, id)
);

-- typeform themes
create table if not exists typeform_themes (
  id varchar,
  name varchar,

  created_at timestamp,
  updated_at timestamp,

  logo_href varchar,

  background_brightness integer,
  background_href varchar,
  background_layout varchar,

  colors_answer varchar,
  colors_background varchar,
  colors_button varchar,
  colors_button_content varchar,
  colors_question varchar,

  fields_alignment varchar,
  fields_font_size varchar,

  font varchar,

  has_transparent_button boolean,
  rounded_corners varchar,

  screens_alignment varchar,
  screens_font_size varchar,

  visibility varchar,

  __hevo__ingested_at integer,
  __hevo__loaded_at integer,

  primary key (id)
);

-- typeform responses
create table if not exists typeform_responses (
  landing_id varchar,
  response_id varchar,
  token varchar,

  landed_at timestamp,
  submitted_at timestamp,

  form_id varchar,
  form_title varchar,
  form_type varchar,

  hidden array,
  variables array,

  metadata_browser varchar,
  metadata_network_id varchar,
  metadata_platform varchar,
  metadata_referer varchar,
  metadata_user_agent varchar,

  calculated_score integer,

  __hevo__ingested_at integer,
  __hevo__loaded_at integer,

  primary key (landing_id)
);

-- typeform answers
create table if not exists typeform_answers (
  landing_id varchar,
  response_id varchar,

  landed_at timestamp,
  submitted_at timestamp,

  form_id varchar,
  form_title varchar,
  form_type varchar,

  type varchar,
  text varchar,
  number integer,
  date timestamp,
  boolean boolean,
  file_url varchar,
  url varchar,
  email varchar,
  phone_number varchar,

  field_id varchar,
  field_ref varchar,
  field_type varchar,

  choice_id varchar,
  choice_ref varchar,
  choice_label varchar,

  choices_ids array,
  choices_refs array,
  choices_labels array,

  __hevo__ingested_at integer,
  __hevo__loaded_at integer,

  primary key (response_id, form_id, field_id)
);
