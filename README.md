# Containers-OrderedSet

[![Build Status](https://travis-ci.org/olekscode/Containers-OrderedSet.svg?branch=master)](https://travis-ci.org/olekscode/Containers-OrderedSet)
[![Build status](https://ci.appveyor.com/api/projects/status/te7uf184lua3svb4?svg=true)](https://ci.appveyor.com/project/olekscode/containers-orderedset)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/Containers-OrderedSet/badge.svg?branch=master)](https://coveralls.io/github/olekscode/Containers-OrderedSet?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/Containers-OrderedSet/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

A `Set` where an order of elements matters or an `OrderedCollection` with no duplicates. Supports the complete API of `Set` and `OrderedCollection`.

## Installation
To install `CTOrderedSet`, go to the Playground (`Ctrl+OW`) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or `Ctrl+D`):

```Smalltalk
Metacello new
  baseline: 'ContainersOrderedSet';
  repository: 'github://pharo-containers/Containers-OrderedSet/src';
  load.
```

## How to depend on it?

If you want to add a dependency on OrderedSet to your project, include the following lines into your baseline:

```Smalltalk
spec
  baseline: 'ContainersOrderedSet'
  with: [ spec repository: 'github://pharo-containers/Containers-OrderedSet/src' ].
```

To read more about baselines and Metacello, check out the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) article on [Pharo Wiki](https://github.com/pharo-open-documentation/pharo-wiki).

## How to use it?

`CTOrderedSet` has the same API as `OrderedCollection`, extended with the methods of `Set`. So instance creation looks the same:

```Smalltalk
firstBasket := CTOrderedSet withAll: #(apple apple orange banana orange banana).
secondBasket := CTOrderedSet withAll: #(banana apple banana banana). 
```

Or you can use the `asOrderedSet` method:

```Smalltalk
firstBasket := #(apple apple orange banana orange banana) asOrderedSet.
secondBasket := #(banana apple banana banana) asOrderedSet. 
```

