import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { map, catchError, tap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class RestService {

  constructor(private http: HttpClient) { }

  private extractData(res: Response) {
    let body = res;
    return body || { };
  }

  getEmployees(): Observable<any> {
    return this.http.get(endpoint + 'Employee').pipe(
      map(this.extractData));
  }

  getEmployee(id): Observable<any> {
    return this.http.get(endpoint + 'Employee/' + id).pipe(
      map(this.extractData));
  }

  addEmployee (employee): Observable<any> {
    console.log(employee);
    return this.http.post<any>(endpoint + 'Employee', JSON.stringify(employee), httpOptions).pipe(
      tap((employee) => console.log(`added Employee w/ id=${employee.id}`)),
      catchError(this.handleError<any>('addEmployee'))
    );
  }
  private handleError<T> (operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
  
      // TODO: send the error to remote logging infrastructure
      console.error(error); // log to console instead
  
      // TODO: better job of transforming error for user consumption
      console.log(`${operation} failed: ${error.message}`);
  
      // Let the app keep running by returning an empty result.
      return of(result as T);
    };
  }
  }
  
  const endpoint = 'http://localhost:44395/';

const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type':  'application/json'
  })
};

