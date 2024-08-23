import http from './api'

export function fetchUsers() {
  return http.get('/users/all-users')
}

export function fetchUserById(id) {
  return http.get(`/users/${id}`)
}

export function deleteUserById(id) {
  return http.delete(`/users/delete/${id}`)
}

export function createUser(data) {
  const formData = new FormData()
  // Append each key-value pair to the FormData object
  Object.entries(data).forEach(([key, value]) => {
    formData.append(key, value)
  })
  return http.post(`/users/create`, formData, {
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  })
}
