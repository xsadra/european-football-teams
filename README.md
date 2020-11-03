<h1 align="center">European Football Teams</h1>

## ✨overview
> A customer needs an app that shows the current ranking of top European football teams. The ranking based on the market values is recalculated daily.


## ✨Requirements - general
**The customer submitted the following `requirements`:**
- App should run under 
  - Android 6.0
  - \(Optional) iOS 12+ & iPhone only
- Main color: ![#01C13B](https://via.placeholder.com/15/01C13B/000000?text=+) `#01C13B`
- App should be prepared for localization. Among other things, it is planned for a later release that English and Polish will be supported in addition to German.
- A design can be found on the following pages.
- The data of the app can be reached at the following URL: [clubs.json](https://public.allaboutapps.at/hiring/clubs.json)

- The app should also be able to be used for other markets in the future. These “app clones” will use a different web interface and colors, the rest should be taken over.
- The app should feel good: correct error handling, follow a meaningful UX<br />


An already implemented backend takes over all evaluations and prepares the data especially for the app. It provides an unsorted list of clubs in the following form (attention, the result contains additional fields that are currently not required in the app):

```json
{
    "name": "Bayern Munich",
    "country": "Germany",
    "value": 539,
    "image":"www.link.com",
    "european_titles": 3
 }
```
```
name …… ..name of the club
country… ... country of the club
value …… ..market value of the club
image ........ URL to the coat of arms of the association
european_titles… # of the won titles
```

### clubs - list view
**Menu Item**
- Toggle
  - Sorting by name in ascending order (default)
  - Sorting by clubdescending order
- There is no selection , the filter changes with every click

<img src="https://lh3.googleusercontent.com/ZdEKdJCLPq_WpLVfw2Nfjjl0JpkRVbIPg2BWJDk4h4sQFcikxo2EGqyyEwRxEshYb7p8gdigI9ZzBNIHmWf_2fCaU9JJPmp63Nx_QI0e">

### Club - detailed view
**Subsequent changes made by the customer:**
The API returns another field which indicates how many titles the respective club has already won at European level (championship cup, Champions League, Europa League)
`Example: "european_titles": 5`
In the detailed view the following should be added:
`“CLUB NAME has so far achieved X victories at European level.”`
![alt text](https://lh6.googleusercontent.com/Dc-UZMXec707_Et8-QTYNg0S6ruZWCYN_M0qW8q1ps22s1jzfbOQZzcTVLDUXTN1vUaj3kO7p990ZUvB8cdSn5dYKe5N7X071_i57v_H)

### Technology tags
`intl`, `RxDart`, `dio`, `retrofit`, `provider`, `GetX`, `Moor`

