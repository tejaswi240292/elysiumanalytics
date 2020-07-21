- dashboard: nist800171_reports_part2
  title: NIST-(800-171) Reports Part-2
  layout: newspaper
  elements:
  - name: HIPPA
    type: text
    title_text: HIPPA
    body_text: |-
      <html>
      <body style="background-color:#FF0000;">
      <font color="#585b88" size="2"><b><u>Audit And Accountability</u></b></font>
      <li><font color="#585b88" size="2">Investigation Reports</font></li>
      <li><font color="#585b88" size="2">System Events</font></li>
      <li><font color="#585b88" size="2">File Integrity Monitoring</font></li>
      </html>
      </body>
    row: 0
    col: 0
    width: 24
    height: 3
  - name: Investigation Reports
    type: text
    title_text: Investigation Reports
    body_text: |-
      <html>
      <body style="background-color:#FF0000;" >
      <font color="#585b88" size="2"><b>Investigation Reports(AU-5; AU-6; AU-6(1); AU-6(3); AU-7; AU-8; AU-8(1))</b></font>
      </body>
      </html>
    row: 3
    col: 0
    width: 24
    height: 2
  - title: Investigation Details
    name: Investigation Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_hour, agg_windows.eventid, agg_windows.type, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2, sum_of_count_2]
    filters: {}
    sorts: [agg_windows.date_hour desc]
    limit: 1000
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, type: count_distinct,
        label: Count of Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count, based_on: agg_windows.count, type: sum, label: Sum of
          Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: total, based_on: agg_windows.count, type: sum, label: Total, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_count_2, based_on: agg_windows.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      agg_windows.entity2: Source user id
      agg_windows.entity1: Reporting Host
      sum_of_count_2: Total
      agg_windows.type: Event Name
    series_cell_visualizations:
      total:
        is_active: true
    value_labels: labels
    label_type: labPer
    start_angle: 90
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
      Event Date: agg_windows.date_date
    row: 17
    col: 0
    width: 24
    height: 6
  - name: System Events
    type: text
    title_text: System Events
    body_text: |-
      <html>
      <body>
      <font color="#585b88" size="2"><b>System Events (AU-2; AU-2(3); AU-3; AU-3(1))</b></font><br>
      <font color="#585b88" size="2"><b>Procedures to review records of information system activity such as audit logs regularly.</b></font><br>
      </body>
      </html>
    row: 23
    col: 0
    width: 24
    height: 3
  - title: System Events Details
    name: System Events Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_hour, agg_windows.eventid, agg_windows.type, agg_windows.hour,
      agg_windows.entity1, total, agg_windows.entity2]
    filters:
      agg_windows.eventid: '4612,516'
    sorts: [total desc]
    limit: 10
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, type: count_distinct,
        label: Count of Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count, based_on: agg_windows.count, type: sum, label: Sum of
          Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: total, based_on: agg_windows.count, type: sum, label: Total, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      agg_windows.type: Event Name
      agg_windows.entity1: Reporting Host
      agg_windows.entity2: Source User ID
    series_cell_visualizations:
      total:
        is_active: true
    value_labels: labels
    label_type: labPer
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
      Event Date: agg_windows.date_date
    row: 37
    col: 0
    width: 24
    height: 4
  - name: File Integrity Monitoring
    type: text
    title_text: File Integrity Monitoring
    body_text: |-
      <html>
      <body style="background-color:#FF0000;" >
      <font color="#585b88" size="2"><b>File Integrity Monitoring(AU-2; AU-2(3); AU-3)</b></font><br>
      <font color="#585b88" size="2"><b>Most organizations today deploy and utilize a wide variety of hosts and devices, which becomes problematic for analysts to keep track of and manage properly. Gaps in the continuous monitoring of devices and assets can lead to an increased risk of unknown or rogue devices infiltrating a network. This dashboard which identifies, categorizes, and tracks multiple types of new and existing network devices and assets.</b></font><br>
      </body>
      </html>
    row: 41
    col: 0
    width: 24
    height: 3
  - title: File Details
    name: File Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_hour, agg_windows.eventid, agg_windows.hour, agg_windows.type,
      agg_windows.entity1, agg_windows.entity2, total]
    filters:
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
    sorts: [agg_windows.date_hour desc]
    limit: 5000
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, type: count_distinct,
        label: Count of Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count, based_on: agg_windows.count, type: sum, label: Sum of
          Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: total, based_on: agg_windows.count, type: sum, label: Total, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      agg_windows.entity1: Host
      agg_windows.entity2: Source User
    series_cell_visualizations:
      sum_of_count:
        is_active: true
      total:
        is_active: true
    value_labels: labels
    label_type: labPer
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
      Event Date: agg_windows.date_date
    row: 54
    col: 0
    width: 24
    height: 5
  - title: Investigation Summary
    name: Investigation Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.type: "-NULL"
    limit: 25
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, type: count_distinct,
        label: Count of Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count, based_on: agg_windows.count, type: sum, label: Sum of
          Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: total, based_on: agg_windows.count, type: sum, label: Total, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    value_labels: labels
    label_type: labPer
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
    listen:
      Event Date: agg_windows.date_date
    row: 5
    col: 0
    width: 12
    height: 6
  - title: Investigation Trends
    name: Investigation Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.type, agg_windows.Count_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.type: "-NULL"
    sorts: [agg_windows.date_date desc, agg_windows.type]
    limit: 500
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, expression: '',
        label: Count of Count, type: count_distinct, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count, based_on: agg_windows.count, expression: '', label: Sum
          of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
    y_axes: [{label: Count, orientation: left, series: [{axisId: count_of_count, id: A
              change has been made to Windows Firewall exception list. A rule was
              added - count_of_count, name: A change has been made to Windows Firewall
              exception list. A rule was added}, {axisId: count_of_count, id: A change
              has been made to Windows Firewall exception list. A rule was deleted
              - count_of_count, name: A change has been made to Windows Firewall exception
              list. A rule was deleted}, {axisId: count_of_count, id: A handle to
              an object has been duplicated - count_of_count, name: A handle to an
              object has been duplicated}, {axisId: count_of_count, id: A Kerberos
              Authentication Ticket (TGT) was issued - count_of_count, name: A Kerberos
              Authentication Ticket (TGT) was issued}, {axisId: count_of_count, id: A
              network share object was accessed - count_of_count, name: A network
              share object was accessed}, {axisId: count_of_count, id: A new process
              has been created - count_of_count, name: A new process has been created},
          {axisId: count_of_count, id: A privileged service was called - count_of_count,
            name: A privileged service was called}, {axisId: count_of_count, id: A
              process has exited - count_of_count, name: A process has exited}, {
            axisId: count_of_count, id: A process was assigned a primary token - count_of_count,
            name: A process was assigned a primary token}, {axisId: count_of_count,
            id: A session was disconnected from a Window Station - count_of_count,
            name: A session was disconnected from a Window Station}, {axisId: count_of_count,
            id: A trusted logon process has registered with the local security authority
              - count_of_count, name: A trusted logon process has registered with
              the local security authority}, {axisId: count_of_count, id: A Windows
              Filtering Platform filter has been changed - count_of_count, name: A
              Windows Filtering Platform filter has been changed}, {axisId: count_of_count,
            id: An attempt was made to register a security event source - count_of_count,
            name: An attempt was made to register a security event source}, {axisId: count_of_count,
            id: An attempt was made to unregister a security event source - count_of_count,
            name: An attempt was made to unregister a security event source}, {axisId: count_of_count,
            id: An authentication package has been loaded by the local security authority
              - count_of_count, name: An authentication package has been loaded by
              the local security authority}, {axisId: count_of_count, id: An notification
              package has been loaded by the security account manager - count_of_count,
            name: An notification package has been loaded by the security account
              manager}, {axisId: count_of_count, id: Attempt to install service -
              count_of_count, name: Attempt to install service}, {axisId: count_of_count,
            id: Cryptographic operation - count_of_count, name: Cryptographic operation},
          {axisId: count_of_count, id: Encrypted data recovery policy changed - count_of_count,
            name: Encrypted data recovery policy changed}, {axisId: count_of_count,
            id: Enumerate - count_of_count, name: Enumerate}, {axisId: count_of_count,
            id: File - count_of_count, name: File}, {axisId: count_of_count, id: Key
              - count_of_count, name: Key}, {axisId: count_of_count, id: Key file
              operation - count_of_count, name: Key file operation}, {axisId: count_of_count,
            id: Logon attempt using explicit credentials - count_of_count, name: Logon
              attempt using explicit credentials}, {axisId: count_of_count, id: Privileged
              object operation - count_of_count, name: Privileged object operation},
          {axisId: count_of_count, id: Process - count_of_count, name: Process}, {
            axisId: count_of_count, id: SAM_ALIAS - count_of_count, name: SAM_ALIAS},
          {axisId: count_of_count, id: SAM_DOMAIN - count_of_count, name: SAM_DOMAIN},
          {axisId: count_of_count, id: SAM_SERVER - count_of_count, name: SAM_SERVER},
          {axisId: count_of_count, id: SAM_USER - count_of_count, name: SAM_USER},
          {axisId: count_of_count, id: SC_MANAGER OBJECT - count_of_count, name: SC_MANAGER
              OBJECT}, {axisId: count_of_count, id: Scheduled task created - count_of_count,
            name: Scheduled task created}, {axisId: count_of_count, id: Security -
              count_of_count, name: Security}, {axisId: count_of_count, id: SERVICE
              OBJECT - count_of_count, name: SERVICE OBJECT}, {axisId: count_of_count,
            id: Special privileges assigned to new logon - count_of_count, name: Special
              privileges assigned to new logon}, {axisId: count_of_count, id: Successful
              local logon to a member server or workstation - count_of_count, name: Successful
              local logon to a member server or workstation}, {axisId: count_of_count,
            id: Successful network logon - count_of_count, name: Successful network
              logon}, {axisId: count_of_count, id: The state of a transaction has
              changed - count_of_count, name: The state of a transaction has changed},
          {axisId: count_of_count, id: The system time was changed - count_of_count,
            name: The system time was changed}, {axisId: count_of_count, id: The Windows
              Filtering Platform blocked a packet - count_of_count, name: The Windows
              Filtering Platform blocked a packet}, {axisId: count_of_count, id: The
              Windows Filtering Platform has allowed a connection - count_of_count,
            name: The Windows Filtering Platform has allowed a connection}, {axisId: count_of_count,
            id: The Windows Filtering Platform has permitted a bind to a local port
              - count_of_count, name: The Windows Filtering Platform has permitted
              a bind to a local port}, {axisId: count_of_count, id: The Windows Filtering
              Platform has permitted an application or service to listen on a port
              for incoming connections - count_of_count, name: The Windows Filtering
              Platform has permitted an application or service to listen on a port
              for incoming connections}, {axisId: count_of_count, id: The workstation
              was locked - count_of_count, name: The workstation was locked}, {axisId: count_of_count,
            id: The workstation was unlocked - count_of_count, name: The workstation
              was unlocked}, {axisId: count_of_count, id: Ticket granted renewed -
              count_of_count, name: Ticket granted renewed}, {axisId: count_of_count,
            id: Token - count_of_count, name: Token}, {axisId: count_of_count, id: Unknown
              - count_of_count, name: Unknown}, {axisId: count_of_count, id: User
              initiated logoff - count_of_count, name: User initiated logoff}, {axisId: count_of_count,
            id: User logoff - count_of_count, name: User logoff}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Event Date
    series_types: {}
    value_labels: labels
    label_type: labPer
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
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
    listen:
      Event Date: agg_windows.date_date
    row: 5
    col: 12
    width: 12
    height: 6
  - title: Top 10 Investigation Hosts
    name: Top 10 Investigation Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.type: "-NULL"
    limit: 10
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, type: count_distinct,
        label: Count of Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count, based_on: agg_windows.count, type: sum, label: Sum of
          Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: total, based_on: agg_windows.count, type: sum, label: Total, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    value_labels: labels
    label_type: labPer
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
    listen:
      Event Date: agg_windows.date_date
    row: 11
    col: 0
    width: 12
    height: 6
  - title: Top 10 Investigation Users
    name: Top 10 Investigation Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.type: "-NULL"
      agg_windows.entity2: "-NULL"
    limit: 10
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, type: count_distinct,
        label: Count of Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count, based_on: agg_windows.count, type: sum, label: Sum of
          Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: total, based_on: agg_windows.count, type: sum, label: Total, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    value_labels: labels
    label_type: labPer
    start_angle: 90
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
    listen:
      Event Date: agg_windows.date_date
    row: 11
    col: 12
    width: 12
    height: 6
  - title: System Events Summary
    name: System Events Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4612,516'
    limit: 25
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, type: count_distinct,
        label: Count of Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count, based_on: agg_windows.count, type: sum, label: Sum of
          Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: total, based_on: agg_windows.count, type: sum, label: Total, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    value_labels: labels
    label_type: labPer
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
    listen:
      Event Date: agg_windows.date_date
    row: 26
    col: 0
    width: 12
    height: 6
  - title: System Events Trends
    name: System Events Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.type, agg_windows.date_date, agg_windows.Count_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4612,516'
    sorts: [agg_windows.date_date desc, agg_windows.type]
    limit: 500
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, type: count_distinct,
        label: Count of Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count, based_on: agg_windows.count, type: sum, label: Sum of
          Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: total, based_on: agg_windows.count, type: sum, label: Total, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {measure: count_of_count_2, based_on: agg_windows.count,
        expression: '', label: Count of Count, type: count_distinct, _kind_hint: measure,
        _type_hint: number}]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Count, orientation: left, series: [{axisId: count_of_count_2,
            id: 'Internal resources allocated for the queuing of audit messages have
              been exhausted, leading to the loss of some audits - count_of_count_2',
            name: 'Internal resources allocated for the queuing of audit messages
              have been exhausted, leading to the loss of some audits'}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Event Date
    series_types: {}
    series_labels:
      count_of_count_2: Count
    value_labels: labels
    label_type: labPer
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
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
    listen:
      Event Date: agg_windows.date_date
    row: 26
    col: 12
    width: 12
    height: 6
  - title: System Events Users
    name: System Events Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4612,516'
    limit: 25
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, type: count_distinct,
        label: Count of Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count, based_on: agg_windows.count, type: sum, label: Sum of
          Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: total, based_on: agg_windows.count, type: sum, label: Total, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_labels: {}
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
    listen:
      Event Date: agg_windows.date_date
    row: 32
    col: 0
    width: 12
    height: 5
  - title: System Events Hosts
    name: System Events Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4612,516'
    limit: 25
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, type: count_distinct,
        label: Count of Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count, based_on: agg_windows.count, type: sum, label: Sum of
          Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: total, based_on: agg_windows.count, type: sum, label: Total, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_labels: {}
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
    listen:
      Event Date: agg_windows.date_date
    row: 32
    col: 12
    width: 12
    height: 5
  - title: Object Access Summary
    name: Object Access Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.eventid, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
    limit: 25
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, type: count_distinct,
        label: Count of Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count, based_on: agg_windows.count, type: sum, label: Sum of
          Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: total, based_on: agg_windows.count, type: sum, label: Total, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_labels: {}
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
    listen:
      Event Date: agg_windows.date_date
    row: 44
    col: 0
    width: 12
    height: 5
  - title: Object Access Trends
    name: Object Access Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.eventid, agg_windows.date_date, agg_windows.Count_of_Count]
    pivots: [agg_windows.eventid]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
    sorts: [agg_windows.date_date desc, agg_windows.eventid]
    limit: 500
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, type: count_distinct,
        label: Count of Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count, based_on: agg_windows.count, type: sum, label: Sum of
          Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: total, based_on: agg_windows.count, type: sum, label: Total, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
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
    value_labels: labels
    label_type: labPer
    series_labels: {}
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
    listen:
      Event Date: agg_windows.date_date
    row: 44
    col: 12
    width: 12
    height: 5
  - title: Top 10 Users Object Accessed
    name: Top 10 Users Object Accessed
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
    limit: 10
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, type: count_distinct,
        label: Count of Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count, based_on: agg_windows.count, type: sum, label: Sum of
          Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: total, based_on: agg_windows.count, type: sum, label: Total, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_labels: {}
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
    listen:
      Event Date: agg_windows.date_date
    row: 49
    col: 0
    width: 12
    height: 5
  - title: Top 10 Hosts Object Accessed
    name: Top 10 Hosts Object Accessed
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
    limit: 10
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, type: count_distinct,
        label: Count of Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count, based_on: agg_windows.count, type: sum, label: Sum of
          Count, expression: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: total, based_on: agg_windows.count, type: sum, label: Total, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_labels: {}
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
    listen:
      Event Date: agg_windows.date_date
    row: 49
    col: 12
    width: 12
    height: 5
  filters:
  - name: Event Date
    title: Event Date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
