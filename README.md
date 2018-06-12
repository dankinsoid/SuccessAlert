# SuccessAlert

## Usage

<table>
  <tr>
    <th width="30%">Here's an example</th>
    <th width="30%">In Action</th>
  </tr>
  <tr>
    <td>Define search for GitHub repositories ...</td>
    <th rowspan="9"><img src="https://raw.githubusercontent.com/kzaher/rxswiftcontent/master/GithubSearch.gif"></th>
  </tr>
  <tr>
    <td><div class="highlight highlight-source-swift"><pre>
let searchResults = searchBar.rx.text.orEmpty
    .throttle(0.3, scheduler: MainScheduler.instance)
    .distinctUntilChanged()
    .flatMapLatest { query -> Observable&lt;[Repository]&gt; in
        if query.isEmpty {
            return .just([])
        }
        return searchGitHub(query)
            .catchErrorJustReturn([])
    }
    .observeOn(MainScheduler.instance)</pre></div></td>
  </tr>
  <tr>
    <td>... then bind the results to your tableview</td>
  </tr>
  <tr>
    <td width="30%"><div class="highlight highlight-source-swift"><pre>
searchResults
    .bind(to: tableView.rx.items(cellIdentifier: "Cell")) {
        (index, repository: Repository, cell) in
        cell.textLabel?.text = repository.name
        cell.detailTextLabel?.text = repository.url
    }
    .disposed(by: disposeBag)</pre></div></td>
  </tr>
</table>

## Installation

SuccessAlert doesn't contain any external dependencies.

These are currently the supported options:

### Manual

Open SuccessAlert.xcworkspace, choose `RxExample` and hit run. This method will build everything and run the sample app

* Drag `Rx.xcodeproj` into Project Navigator
* Go to `Project > Targets > General > Embedded Binaries`, click `+` and select `SuccessAlert` target

### [Carthage](https://github.com/Carthage/Carthage)

Add this to `Cartfile`

```
git "https://github.com/dankinsoid/SuccessAlert.git" "master"
```

```bash
$ carthage update
```
