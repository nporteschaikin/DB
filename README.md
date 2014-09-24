DB
==

An Objective-C/Cocoa [SQLite](http://sqlite.org/) wrapper.  Includes an [active record](http://en.wikipedia.org/wiki/Active_record_pattern) implementation, migrations, and more.

### Usage

##### DBDatabase

`DBDatabase` handles creating, opening, and querying an SQLite database.

##### DBMigrator

`DBMigrator` handles migrations for an instance of `DBDatabase`.

##### DBMigration

An instance of `DBMigration` contains an `upQuery` and `downQuery`.

##### DBObject

An [active record](http://en.wikipedia.org/wiki/Active_record_pattern) object.

##### DBFetchedResultsController

A port of `NSFetchedResultsController` for `DBObject`; like its predecessor, intended to be used with a `UITableView`.

### Tasks

- [x] fetching
- [x] creating
- [x] updating
- [x] migrations
- [ ] validations
- [ ] inflect default `[[DBObject class] tableName]` better
- [x] refactor ~~DBAdapter~~ now called `DBDatabase`
  - [ ] zero-configuration database creation (?)
  - [ ] cleaner code
- [ ] error handling
- [ ] tests
- [x] turn into framework
- [ ] better README
- [x] `DBFetchedResultsController`
  - [ ] handle adding/removing objects
  - [ ] similarly, use the delegate

### License

[MIT](LICENSE.md).
