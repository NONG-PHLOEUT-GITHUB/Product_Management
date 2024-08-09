import http from './api'

export function fetchProducts(){
    return http.get('/products/all-products');
}