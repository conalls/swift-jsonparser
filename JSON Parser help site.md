## JSON Parser 만들기 참고 사이트

* 문법검사 

  https://jsonlint.com/

* JSON 배우기 및 확인

  https://regexr.com/

  https://regexone.com/lesson/capturing_groups
  http://www.rubular.com/

  https://regex101.com/



배열 내부 요인 뽑아보기

```
(\d)|(false|true)|(".*?")|({.}) 

 [ 1, "test", false   , true , { "name" : "Lee" }]
```



객체내에 배열 금지

```
\{.[^\[\]]*\}

```

