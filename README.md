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

```smalltalk
Metacello new
  baseline: 'ContainersOrderedSet';
  repository: 'github://olekscode/Containers-OrderedSet/src';
  load.
```
