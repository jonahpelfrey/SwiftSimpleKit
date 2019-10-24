# Swift Simple Kit
# Core
### ControllerView
* Move UI code out of the view controller
* Provide static typing for view references in the controller

```swift
class ControllerView: UIView {
    required init(controller: UIViewController)
    func configureSubviews() {}
}
```

### Controller
* Require generic view type conforming to ControllerView type
* Responsible for instantiating view

```swift
class Controller<View: ControllerView>: UIViewController {
    var childView: View!
    func configure() {}
}
```

# Simple List
### Simple List Cell Compatible
* Interface allowing for declarative cell properties
* Properties include both view properties and data requirements
* Hashable requirement allows data type to conform to DiffableDataSources

```swift
public protocol SimpleListCellCompatible: class {
    associatedType DataObjectType: Hashable
    func setData(_ data: DataObjectType, _ indexPath: IndexPath)
    
    static var reuseIdentifier: String { get }
    static var height: CGFloat { get }
    static var spacing: CGFloat { get }
    static var contentInsets: NSDirectionalEdgeInsets { get }
}
```

### Simple List View
* View inheriting from ControllerView
* Contains a single collection view bound to the bounds of the frame

```swift
typealias CompatibleCell = UICollectionViewCell & SimpleListCellCompatible

class SimpleListView<Cell: CompatibleCell>: ControllerView {
    var collectionView: UICollectionView
    func createLayout() -> UICollectionViewLayout
}
```

### Simple List Controller
* Inherits from Controller
* Subclassing requires explicit type for a view inheriting from SimpleListView
* Subclassing requires explicit type for a cell adhering to CellCompatible

```swift
class SimpleListController<Cell: CellCompatible>: Controller<SimpleListView<Cell>>, UICollectionViewDelegate {
    enum Section: CaseIterable {}
    var dataSource: UICollectionViewDiffableDataSource<Section, Cell.DataObjectType>!
    func updateDataSource(_ data: [Cell.DataObjectType])
}
```