- dashboard: statistical_data__information
  title: Statistical Data / Information
  layout: newspaper
  elements:
  - title: Details
    name: Details
    model: odm
    explore: statistical_data_view
    type: table
    fields: [statistical_data_view.name, statistical_data_view.city, statistical_data_view.description,
      statistical_data_view.event_date, statistical_data_view.first_seen_hour, statistical_data_view.last_seen_hour,
      statistical_data_view.activity_count, statistical_data_view.total_bytes_downloaded,
      statistical_data_view.total_bytes_uploaded, statistical_data_view.total_email_size,
      statistical_data_view.no_of_files_accessed, statistical_data_view.no_of_emails,
      statistical_data_view.succesfull_logins, statistical_data_view.failed_logins,
      statistical_data_view.total_distinct_domains, statistical_data_view.data_uploaded_in_last_3_days,
      statistical_data_view.mean_data_downloaded_eachday, statistical_data_view.mean_data_uploaded_eachday,
      statistical_data_view.displayname, statistical_data_view.emailaddress, statistical_data_view.no_of_sessions,
      statistical_data_view.total_rdp_server_count, statistical_data_view.last_seen_privelege_total_hour]
    filters: {}
    sorts: [statistical_data_view.event_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
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
    listen:
      Name: statistical_data_view.name
      Date: statistical_data_view.event_date
    row: 10
    col: 0
    width: 24
    height: 8
  - title: City
    name: City
    model: odm
    explore: statistical_data_view
    type: looker_pie
    fields: [statistical_data_view.city, statistical_data_view.count]
    filters:
      statistical_data_view.city: "-NULL"
    sorts: [statistical_data_view.count desc]
    limit: 500
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Name: statistical_data_view.name
      Date: statistical_data_view.event_date
    row: 0
    col: 0
    width: 9
    height: 5
  - title: Bandwidth Usage/City
    name: Bandwidth Usage/City
    model: odm
    explore: statistical_data_view
    type: looker_pie
    fields: [statistical_data_view.city, statistical_data_view.count, statistical_data_view.sum_of_bandwidth]
    filters:
      statistical_data_view.city: "-NULL"
    sorts: [statistical_data_view.count desc]
    limit: 500
    dynamic_fields: [{dimension: bandwidth, label: Bandwidth, expression: "${statistical_data_view.total_bytes_downloaded}+${statistical_data_view.total_bytes_uploaded}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}, {measure: bandwidth_sum, based_on: bandwidth, type: sum,
        label: Bandwidth (Sum), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    show_value_labels: true
    font_size: 12
    hidden_fields: [statistical_data_view.count]
    listen:
      Name: statistical_data_view.name
      Date: statistical_data_view.event_date
    row: 5
    col: 0
    width: 9
    height: 5
  - title: Total Activity Per Region
    name: Total Activity Per Region
    model: odm
    explore: statistical_data_view
    type: looker_line
    fields: [statistical_data_view.event_date, statistical_data_view.city, statistical_data_view.Sum_Of_Activity_Count]
    pivots: [statistical_data_view.city]
    fill_fields: [statistical_data_view.event_date]
    filters:
      statistical_data_view.city: "-NULL"
    sorts: [statistical_data_view.event_date desc, statistical_data_view.city]
    limit: 1000
    dynamic_fields: [{measure: activity_count_sum, based_on: statistical_data_view.activity_count,
        type: sum, label: Activity Count (Sum), expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      Name: statistical_data_view.name
      Date: statistical_data_view.event_date
    row: 0
    col: 9
    width: 15
    height: 5
  - title: Top 10 Users/Bandwidth
    name: Top 10 Users/Bandwidth
    model: odm
    explore: statistical_data_view
    type: looker_column
    fields: [statistical_data_view.name, statistical_data_view.sum_of_bandwidth]
    filters:
      statistical_data_view.city: "-NULL"
    limit: 500
    dynamic_fields: [{dimension: bandwidth, label: Bandwidth, expression: "${statistical_data_view.total_bytes_downloaded}+${statistical_data_view.total_bytes_uploaded}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}, {measure: bandwidth_sum, based_on: bandwidth, type: sum,
        label: Bandwidth (Sum), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: true
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
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    font_size: '12'
    series_types: {}
    series_colors:
      bandwidth_sum: "#E57947"
    value_labels: labels
    label_type: labPer
    defaults_version: 1
    hidden_fields:
    listen:
      Name: statistical_data_view.name
      Date: statistical_data_view.event_date
    row: 5
    col: 9
    width: 15
    height: 5
  - title: Web Domain Statistics
    name: Web Domain Statistics
    model: dga
    explore: web_domain_stat
    type: looker_grid
    fields: [web_domain_stat.DST_DOMAIN, web_domain_stat.FIRST_SEEN, web_domain_stat.LAST_SEEN,
      web_domain_stat.NONGENUINE_PERCENT, web_domain_stat.TOTAL_BYTES, web_domain_stat.USER]
    filters:
      web_domain_stat.datefilter: 15 days
    sorts: [web_domain_stat.FIRST_SEEN desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    listen:
      Name: web_domain_stat.Userfilter
      Date: web_domain_stat.FIRST_SEEN
    row: 18
    col: 0
    width: 24
    height: 7
  filters:
  - name: Name
    title: Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: itd
    explore: itd_360view
    listens_to_filters: []
    field: itd_360view.userid
  - name: Date
    title: Date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
