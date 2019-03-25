# data_binding

This is a library of Flutter for data binding works as similar as what Android does.   
类Android的Flutter数据绑定库。

## How to use
1. Create sub class of ```BaseViewModel``` with ```Observable```s.   
	创建```BaseViewModel```的子类，在其中添加多个```Observable```。
	
2. Create sub class of ```BindingWidgetBuilder```, which builds Widget with the data from a ```Observable```.   
	创建```BindingWidgetBuilder```的子类，其用某个```Observable```的数据来生成Widget。
	
3. ```binding()``` the ```Observable``` and the ```BindingWidgetBuilder```.   
	用```binding()```绑定```Observable```和```BindingWidgetBuilder```。
	
4. When the ```property``` of the ```Observable``` in the ViewModel was changed, the Widget would be updated.   
	当ViewModel中的```Observable```的```property```被改变时，Widget也会更新。
	
	
	