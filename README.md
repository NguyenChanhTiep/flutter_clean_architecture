# TDD Clean Architecture for Flutter
<br />
<h3>Clean Architecture Onion</h3>
<img src="./clean_architecture_onion.jpeg" />
<h3>Architecture Proposal</h3>
<br />

<img src="./clean_architecture_call_flow.png" style="display: block; margin-left: auto; margin-right: auto; width: 75%;"/>

<br />
<br />
<h3>Folder structure</h3>

```
lib/
    data/                         <--- Data layer
        models/                       <-- Models are entities with some additional functionality added on top, serialized and deserialized to/from JSON.
        datasources/                  <-- CRUD data (Ex: Fetch data from API, fetch cached data from DB, location from device...)
        repositories/                 <-- repositories (retrieve data, heavy processing etc..)

    usecases/                     <--- Domain Layer - use cases

    blocs/                        <--- UI logic layer - Blocs, MVVM, MVP

    pages/                        <--- UI layer
        page_name/                     <-- pages name folder
          page_name.dart                   <-- page widget
          widgets/                         <-- custom widgets
    main.dart                     <--- entry point

```