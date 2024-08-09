import http from './api'

export function fetchSuppliers(){
    return http.get('/suppliers/all-suppliers');
}