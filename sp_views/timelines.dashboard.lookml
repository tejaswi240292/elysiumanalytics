- dashboard: timeline_dashboard
  title: Timeline Dashboard
  layout: newspaper
  elements:
  - title: Timeline Activity
    name: Timeline Activity
    model: sp
    explore: test123
    type: TIMELINE CC
    fields: [test123.session_start_time_time, test123.session_end_time_time, test123.type,
      test123.src_user_name]
    filters: {}
    sorts: [test123.src_user_name desc]
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    series_types: {}
    listen:
      Date: test123.session_start_time_date
      User: test123.src_user_name
      type: test123.type
    row: 5
    col: 0
    width: 24
    height: 12
  - title: Events Occured
    name: Events Occured
    model: sp
    explore: test123
    type: single_value
    fields: [test123.count]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date: test123.session_start_time_date
      User: test123.src_user_name
      type: test123.type
    row: 0
    col: 9
    width: 5
    height: 5
  - title: Active Directory
    name: Active Directory
    model: sp
    explore: activedirectory
    type: looker_single_record
    fields: [activedirectory.name, activedirectory.emailaddress, activedirectory.description,
      activedirectory.displayname, activedirectory.country, activedirectory.city]
    filters: {}
    sorts: [activedirectory.name]
    limit: 500
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      User: activedirectory.name
    row: 0
    col: 0
    width: 9
    height: 5
  - title: Types Of Data
    name: Types Of Data
    model: sp
    explore: test123
    type: looker_bar
    fields: [test123.count, test123.status]
    filters: {}
    sorts: [test123.count desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hide_legend: false
    series_types: {}
    value_labels: labels
    label_type: labVal
    defaults_version: 1
    listen:
      Date: test123.session_start_time_date
      User: test123.src_user_name
      type: test123.type
    row: 0
    col: 14
    width: 10
    height: 5
  - title: Details
    name: Details
    model: sp
    explore: test123
    type: table
    fields: [test123.status, test123.Details, test123.Details_Information, test123.duration_hr]
    filters: {}
    sorts: [test123.Details]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    series_column_widths:
      test123.Details: 319
    listen:
      Date: test123.session_start_time_date
      User: test123.src_user_name
      type: test123.type
    row: 23
    col: 0
    width: 24
    height: 7
  - title: Aggregates/Profilers
    name: Aggregates/Profilers
    model: itd
    explore: heatmaptest
    type: table
    fields: [heatmaptest.event_time_hour, heatmaptest.dwnld_bytes, heatmaptest.email_size,
      heatmaptest.failedlogin_count, heatmaptest.fileactivity_count, heatmaptest.if_dwnld_count,
      heatmaptest.if_upld_count, heatmaptest.logins_count, heatmaptest.pri_count,
      heatmaptest.ps_count, heatmaptest.upld_bytes]
    filters: {}
    sorts: [heatmaptest.event_time_hour]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not equal to, value: 0, background_color: "#17465e",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}, {type: equal to, value: 0, background_color: '',
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    series_types: {}
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Date: heatmaptest.event_time_date
      User: heatmaptest.name
    row: 17
    col: 0
    width: 24
    height: 6
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 2020/05/18
    allow_multiple_values: true
    required: false
  - name: User
    title: User
    type: field_filter
    default_value: vinisha.soni
    allow_multiple_values: true
    required: false
    model: sp
    explore: test123
    listens_to_filters: []
    field: test123.src_user_name
  - name: type
    title: type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: sp
    explore: test123
    listens_to_filters: []
    field: test123.type
