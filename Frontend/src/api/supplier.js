import http from './api'

export function fetchSuppliers(){
    return http.get('/suppliers/all-suppliers');
}
export function fetchSupplierById(id){
    return http.get(`/suppliers/${id}`);
}
export function deleteSupplierById(id){
    return http.delete(`/suppliers/delete/${id}`);
}
export function createSupplier(data){
    return http.post(`/suppliers/create`,data);
}