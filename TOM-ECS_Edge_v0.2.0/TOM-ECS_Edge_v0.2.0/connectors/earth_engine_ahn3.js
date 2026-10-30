// Run in an authenticated Google Earth Engine Code Editor session.
// User action required: choose a small area of interest; no account is connected
// by this file and no export task is started automatically.
// Dataset documentation: https://developers.google.com/earth-engine/datasets/catalog/AHN_AHN3
var area = ee.Geometry.Rectangle([5.75, 51.84, 5.78, 51.87]);
var collection = ee.ImageCollection('AHN/AHN3').filterBounds(area);
var terrain = collection.select('dtm').mosaic().clip(area);
var surface = collection.select('dsm').mosaic().clip(area);
Map.centerObject(area, 13);
Map.addLayer(terrain, {min: -5, max: 35}, 'AHN3 terrain, historical 2014-2019');
Map.addLayer(surface, {min: -5, max: 35}, 'AHN3 surface, historical 2014-2019', false);
print('Source collection', collection);
print('This is historical airborne-LiDAR elevation, not a live satellite feed.');
// To integrate with the phone, produce a bounded, georeferenced tile or query
// via an authenticated backend. Preserve CRS, vertical datum, nodata and time.
// Never put a service-account private key inside an Android APK.
