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
    data/                         <--- data layer
        models/                      <-- Models are entities with some additional functionality added on top, serialized and deserialized to/from JSON.
        datasources/                <-- CRUD data (Ex: Fetch data from API, fetch cached data from DB, location from device...)
        repositories/                 <-- repositories (retrieve data, heavy processing etc..)
    domain/                       <--- domain layer (business and enterprise)
        entities/                   <--- enterprise entities (core classes of the app)
          user.dart                   <-- example entity
          manager.dart                <-- example entity
        usecases/                   <--- business processes e.g. Login, Logout, GetUser, etc..
          login_usecase.dart          <-- example usecase extends `UseCase`
        repositories/               <--- abstract classes that define functionality for data layer
    pages/                          <--- presentation layer
        page_name/                        <-- pages name folder
          page_name.dart                  <-- page widget
          widgets/                      <-- custom widgets
          bloc/                        <-- BLoC, MVVM, MVP...
    main.dart                     <--- entry point

```